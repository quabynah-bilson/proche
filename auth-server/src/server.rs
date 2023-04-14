use chrono::{DateTime, Utc};
use futures::StreamExt;
use mongodb::bson::{Bson, doc, Document};
use mongodb::options::FindOptions;
use regex::Regex;
use rust_i18n::t;
use tonic::{async_trait, Request, Response, Status};
use tonic::metadata::MetadataMap;

use crate::{config, utils};
use crate::config::{locale, tokenizer};
use crate::proto::{Account, Country, GetCountriesResponse, LoginRequest, RegisterRequest, ResetPasswordRequest, ValidateAccessTokenResponse, VerifyPhoneRequest};
use crate::proto::auth_service_server::AuthService;

rust_i18n::i18n!("locales");

pub struct AuthServiceImpl {
    pub account_col: mongodb::Collection<Document>,
    pub token_col: mongodb::Collection<Document>,
    pub country_col: mongodb::Collection<Document>,
}

impl AuthServiceImpl {
    pub fn new(account_col: mongodb::Collection<Document>, token_col: mongodb::Collection<Document>, country_col: mongodb::Collection<Document>) -> Self {
        Self {
            account_col,
            token_col,
            country_col,
        }
    }
}

#[async_trait]
impl AuthService for AuthServiceImpl {
    // done
    async fn login(&self, request: Request<LoginRequest>) -> Result<Response<String>, Status> {
        // start login
        log::info!("{}", t!("auth_started"));

        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_language_code"), e);
                return Err(Status::invalid_argument(t!("invalid_language_code")));
            }
        };

        // verify public token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        // parse request
        let req = request.into_inner();

        // get account from db
        let account = match self.account_col.find_one(doc! {"phone_number": &req.phone_number}, None).await {
            Ok(account) => account,
            Err(e) => {
                log::error!("{}: {:?}", t!("account_not_found"), e);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // create a new session for account
        match account {
            Some(account_doc) => {
                log::info!("{}: {:#?}", t!("account_found"), &account_doc);

                // compare password
                let is_valid_password = match tokenizer::compare_password(&req.password, &account_doc.get_str("password").unwrap().to_string()) {
                    Ok(is_valid) => is_valid,
                    Err(e) => {
                        log::error!("{}: {:?}", t!("invalid_credentials"), e);
                        return Err(Status::unauthenticated(t!("invalid_credentials")));
                    }
                };
                if !is_valid_password {
                    log::error!("{}: {:?}", t!("invalid_credentials"), &req.password);
                    return Err(Status::unauthenticated(t!("invalid_credentials")));
                }

                // compare country id
                let is_valid_country = match account_doc.get_str("country_id") {
                    Ok(country_id) => {
                        if country_id == &req.country_id {
                            true
                        } else {
                            false
                        }
                    }
                    Err(_) => false
                };
                if !is_valid_country {
                    log::error!("{}: {:?}", t!("invalid_credentials"), &req.country_id);
                    return Err(Status::unauthenticated(t!("invalid_credentials")));
                }

                // generate access token
                let access_token = config::session_manager::create_access_token(&account_doc.get_str("id").unwrap().to_string(), &language_id, &self.token_col).await.unwrap();
                Ok(Response::new(access_token))
            }
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &account);
                return Err(Status::not_found(t!("account_not_found")));
            }
        }
    }

    // done
    async fn register(&self, request: Request<RegisterRequest>) -> Result<Response<String>, Status> {
        // start login
        log::info!("{}", t!("auth_started"));

        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        // parse request
        let req = request.into_inner();

        // get account from db
        let has_existing_account = match self.account_col.find_one(doc! {"phone_number": &req.phone_number}, None).await.unwrap() {
            Some(acct_doc) => {
                log::info!("{}: {:#?}", t!("account_found"), &acct_doc);
                true
            }
            None => false
        };
        if has_existing_account {
            return Err(Status::already_exists(t!("account_exists")));
        }

        // encrypt password
        let hashed_password = match tokenizer::hash_password(&req.password) {
            Ok(hashed_password) => hashed_password,
            Err(e) => {
                log::error!("{}: {:?}", t!("password_encryption_failed"), e);
                return Err(Status::internal(t!("password_encryption_failed")));
            }
        };

        // create a new account
        let mut account_doc = doc! {
            "phone_number" : &req.phone_number,
            "display_name" : &req.display_name,
            "language_id" : &language_id,
            "avatar_url" : &req.avatar_url.unwrap_or("".to_string()),
            "id_card_url" : &req.id_card_url.unwrap_or("".to_string()),
            "vaccine_card_url" : &req.vaccine_card_url.unwrap_or("".to_string()),
            "referral_code" : &req.referral_code.unwrap_or("".to_string()),
            "password" : &hashed_password,
            "country_id" : &req.country_id,
            "created_at": _create_timestamp_field(),
            "updated_at": _create_timestamp_field(),    // aka: last login
        };

        // save account to db
        match self.account_col.insert_one(&account_doc.clone(), None).await {
            Ok(result) => {
                // update id field with result
                account_doc.insert("id", &result.inserted_id.as_object_id().unwrap().to_hex());

                // replace one in db with updated account doc
                match self.account_col.replace_one(doc! {"phone_number": &req.phone_number}, &account_doc, None).await {
                    Ok(_) => {
                        log::info!("{}: {:?}", t!("auth_success"), &account_doc);
                    }
                    Err(e) => {
                        log::error!("{}: {:?}", t!("auth_failed"), e);
                        return Err(Status::internal(t!("auth_failed")));
                    }
                }

                // create a new access token
                let access_token = config::session_manager::create_access_token(&account_doc.get_str("id").unwrap().to_string(), &language_id, &self.token_col).await.unwrap();
                Ok(Response::new(access_token))
            }
            Err(e) => {
                log::error!("{}: {:?}", t!("auth_failed"), e);
                return Err(Status::internal(t!("auth_failed")));
            }
        }
    }

    // done
    async fn reset_password(&self, request: Request<ResetPasswordRequest>) -> Result<Response<String>, Status> {
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        // get request
        let req = request.into_inner();

        // find account by phone number
        let mut account_doc = match self.account_col.find_one(doc! {"phone_number": &req.phone_number}, None).await.unwrap() {
            Some(acct_doc) => {
                log::info!("{}: {:?}", t!("account_exists"), &acct_doc);
                acct_doc
            }
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &req.phone_number);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // encrypt password
        let hashed_password = match tokenizer::hash_password(&req.password) {
            Ok(hashed_password) => hashed_password,
            Err(e) => {
                log::error!("{}: {:?}", t!("password_encryption_failed"), e);
                return Err(Status::internal(t!("password_encryption_failed")));
            }
        };

        // update password
        account_doc.insert("password", &hashed_password);

        // replace one in db with updated account doc
        match self.account_col.replace_one(doc! {"phone_number": &req.phone_number}, &account_doc, None).await {
            Ok(_) => {
                log::info!("{}: {:?}", t!("password_reset_success"), &account_doc);

                // create access token
                let access_token = config::session_manager::create_access_token(&account_doc.get_str("id").unwrap().to_string(), &language_id, &self.token_col).await.unwrap();
                Ok(Response::new(access_token))
            }
            Err(e) => {
                log::error!("{}: {:?}", t!("password_reset_failed"), e);
                return Err(Status::internal(t!("password_reset_failed")));
            }
        }
    }

    // done
    async fn logout(&self, request: Request<()>) -> Result<Response<()>, Status> {
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col).await {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        match config::session_manager::clear_access_token(&request.metadata(), &self.token_col).await {
            Ok(()) => Ok(Response::new(())),
            Err(e) => {
                log::error!("{}: {:?}", t!("logout_failed"), e);
                return Err(Status::internal(t!("logout_failed")));
            }
        }
    }

    // done
    async fn request_public_access_token(&self, _: Request<()>) -> Result<Response<String>, Status> {
        // generate a new public token from tokenizer
        match tokenizer::generate_public_token(&rust_i18n::locale()) {
            // return token if successful else return status internal
            Ok(token) => Ok(Response::new(token)),
            Err(e) => {
                log::error!("{}: {:?}", t!("access_denied"), e);
                Err(Status::internal(t!("access_denied")))
            }
        }
    }

    // done
    async fn validate_access_token(&self, request: Request<()>) -> Result<Response<ValidateAccessTokenResponse>, Status> {
        let language_id = match _validate_language_id_from_request(&request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // get auth type from request
        let use_private_token = match _get_authentication_type_from_metadata(&request.metadata()) {
            Ok(use_private_token) => use_private_token,
            Err(e) => {
                return Err(e);
            }
        };

        if use_private_token {
            // verify access token
            let token = match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col).await {
                Ok(token) => token,
                Err(e) => {
                    return Err(e);
                }
            };

            // get account by id
            let account_doc = match self.account_col.find_one(doc! {"id": &token.0}, None).await.unwrap() {
                Some(acct_doc) => {
                    log::info!("{}: {:?}", t!("account_exists"), &acct_doc);
                    acct_doc
                }
                None => {
                    log::error!("{}: {:?}", t!("account_not_found"), &token.0);
                    return Err(Status::not_found(t!("account_not_found")));
                }
            };

            Ok(Response::new(ValidateAccessTokenResponse {
                account_id: Some(account_doc.get_str("id").unwrap().to_string()),
                phone_number: Some(account_doc.get_str("phone_number").unwrap().to_string()),
                display_name: Some(account_doc.get_str("display_name").unwrap().to_string()),
            }))
        } else {
            // verify public token
            match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
                Ok(_) => Ok(Response::new(ValidateAccessTokenResponse {
                    account_id: None,
                    phone_number: None,
                    display_name: None,
                })),
                Err(e) => Err(e),
            }
        }
    }

    // done
    async fn get_account(&self, request: Request<()>) -> Result<Response<Account>, Status> {
        // validate language id
        match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify access token
        let token_payload = match config::session_manager::verify_access_token(&request.metadata(), &rust_i18n::locale().as_str().to_string(), &self.token_col).await {
            Ok(result) => (result.0, result.1),
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get account id from token payload and language id
        let account_id = token_payload.0;
        let language_id = token_payload.1;

        // find account by id
        let account_doc = match self.account_col.find_one(doc! {"id": &account_id}, None).await.unwrap() {
            Some(acct_doc) => {
                log::info!("{}: {:?}", t!("account_exists"), &acct_doc);
                acct_doc
            }
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &account_id);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // create account object from account doc
        let account = Account {
            id: account_doc.get_str("id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            country_id: account_doc.get_str("country_id").unwrap_or("en-proche-233").to_string(),
            referral_code: Some(account_doc.get_str("referral_code").unwrap().to_string()),
            language_id: language_id.to_string(),
            created_at: _parse_timestamp_field(account_doc.get("created_at").unwrap()),
            updated_at: _parse_timestamp_field(account_doc.get("updated_at").unwrap()),
            avatar_url: Some(account_doc.get_str("avatar").unwrap_or("").to_string()),
            id_card_url: Some(account_doc.get_str("id_card").unwrap_or("").to_string()),
            display_name: account_doc.get_str("display_name").unwrap_or("").to_string(),
            vaccine_card_url: Some(account_doc.get_str("vaccine_card").unwrap_or("").to_string()),
        };

        Ok(Response::new(account))
    }

    // done
    async fn get_account_by_phone_number(&self, request: Request<String>) -> Result<Response<Account>, Status> {
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(_) => (),
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(e);
            }
        };

        // find account by id
        let phone_number = request.into_inner();
        let account_doc = match self.account_col.find_one(doc! {"phone_number": &phone_number}, None).await.unwrap() {
            Some(acct_doc) => {
                log::info!("{}: {:?}", t!("account_exists"), &acct_doc);
                acct_doc
            }
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &phone_number);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // create account object from account doc
        let account = Account {
            id: account_doc.get_str("id").unwrap().to_string(),
            country_id: account_doc.get_str("country_id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            referral_code: Some(account_doc.get_str("referral_code").unwrap().to_string()),
            language_id: language_id.to_string(),
            created_at: _parse_timestamp_field(account_doc.get("created_at").unwrap()),
            updated_at: _parse_timestamp_field(account_doc.get("updated_at").unwrap()),
            avatar_url: Some(account_doc.get_str("avatar").unwrap_or("").to_string()),
            id_card_url: Some(account_doc.get_str("id_card").unwrap_or("").to_string()),
            display_name: account_doc.get_str("display_name").unwrap_or("").to_string(),
            vaccine_card_url: Some(account_doc.get_str("vaccine_card").unwrap_or("").to_string()),
        };

        Ok(Response::new(account))
    }

    // done
    async fn update_account(&self, request: Request<Account>) -> Result<Response<Account>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify access token using tokenizer
        match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col).await {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // extract account object from request
        let account = request.into_inner();

        // perform account update with account object from request
        match self.account_col.find_one_and_update(doc! {"id": &account.id}, doc! {"$set": {
            "display_name": &account.display_name,
            "avatar": &account.avatar_url.unwrap(),
            "id_card": &account.id_card_url.unwrap(),
            "vaccine_card": &account.vaccine_card_url.unwrap(),
            "updated_at": _create_timestamp_field(),
            "country_id" : &account.country_id,
        }}, None).await.unwrap() {
            Some(acct_doc) => acct_doc,
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &account.id);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // get the updated account document
        let account_doc = match self.account_col.find_one(doc! {"id": &account.id}, None).await.unwrap() {
            Some(acct_doc) => acct_doc,
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &account.id);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // create account object to return
        let account = Account {
            id: account_doc.get_str("id").unwrap().to_string(),
            country_id: account_doc.get_str("country_id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            created_at: _parse_timestamp_field(account_doc.get("created_at").unwrap()),
            updated_at: _parse_timestamp_field(account_doc.get("updated_at").unwrap()),
            avatar_url: Some(account_doc.get_str("avatar").unwrap_or("").to_string()),
            id_card_url: Some(account_doc.get_str("id_card").unwrap_or("").to_string()),
            display_name: account_doc.get_str("display_name").unwrap_or("").to_string(),
            vaccine_card_url: Some(account_doc.get_str("vaccine_card").unwrap_or("").to_string()),
            language_id,
            referral_code: Some(account_doc.get_str("referral_code").unwrap_or("").to_string()),
        };

        Ok(Response::new(account))
    }

    // done
    async fn delete_account(&self, request: Request<()>) -> Result<Response<()>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify access token using tokenizer
        let token = match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col).await {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // delete account using account id from token payload
        match self.account_col.delete_one(doc! {"id": &token.0}, None).await {
            Ok(_) => Ok(Response::new(())),
            Err(e) => {
                log::error!("{}: {:?}", t!("account_not_found"), e);
                return Err(Status::not_found(t!("account_not_found")));
            }
        }
    }

    // done
    async fn send_phone_verification_code(&self, request: Request<String>) -> Result<Response<()>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate public access token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(_) => (),
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get phone number from request
        let phone_number = request.into_inner();

        // send verification code to phone number
        match config::sms_manager::TwilioVerifyService::send_sms(&phone_number, &language_id).await {
            Ok(_) => Ok(Response::new(())),
            Err(e) => {
                log::error!("{}: {:?}", t!("sms_send_failed"), e);
                return Err(Status::internal(t!("sms_send_failed")));
            }
        }
    }

    // done
    async fn verify_phone_verification_code(&self, request: Request<VerifyPhoneRequest>) -> Result<Response<()>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate public access token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(_) => (),
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get phone number from request
        let req = request.into_inner();
        let phone_number = &req.phone_number;
        let verification_code = &req.verification_code;

        // verify verification code
        match config::sms_manager::TwilioVerifyService::verify_sms(&phone_number, &verification_code, &language_id).await {
            Ok(_) => Ok(Response::new(())),
            Err(e) => {
                log::error!("{}: {:?}", t!("sms_verification_failed"), e);
                return Err(Status::internal(t!("sms_verification_failed")));
            }
        }
    }

    // done
    async fn get_referral_code(&self, request: Request<()>) -> Result<Response<String>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify access token using tokenizer
        let token = match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col).await {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get account using account id from token payload
        let account_doc = match self.account_col.find_one(doc! {"id": &token.0}, None).await.unwrap() {
            Some(acct_doc) => acct_doc,
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &token.0);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // get referral code from account document
        match account_doc.get_str("referral_code") {
            Ok(referral_code) => Ok(Response::new(referral_code.to_string())),
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_referral_code"), e);
                return Err(Status::internal(t!("invalid_referral_code")));
            }
        }
    }

    // done
    async fn get_referral_code_by_phone_number(&self, request: Request<String>) -> Result<Response<String>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        let token = match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col).await {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get phone number from request
        let phone_number = request.into_inner();

        // get referral code using phone number from request
        let referral_code = match self.account_col.find_one(doc! {"phone_number": &phone_number}, None).await.unwrap() {
            Some(acct_doc) => acct_doc.get_str("referral_code").unwrap().to_string(),
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &token.0);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        Ok(Response::new(referral_code))
    }

    // done
    async fn get_countries(&self, request: Request<()>) -> Result<Response<GetCountriesResponse>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get countries from database
        let opts = FindOptions::builder()
            .sort(doc! {"name": 1})
            .build();
        let mut cursor = match self.country_col.find(None, opts).await {
            Ok(countries) => countries,
            Err(e) => {
                log::error!("{}: {:?}", t!("countries_not_found"), e);
                return Err(Status::not_found(t!("countries_not_found")));
            }
        };

        // create countries vector
        let mut countries = vec![];

        // iterate through cursor
        while let Some(result) = cursor.next().await {
            match result {
                Ok(document) => {
                    let country = Country {
                        id: document.get_str("id").unwrap().to_string(),
                        name: document.get_str("name").unwrap().to_string(),
                        code: document.get_str("code").unwrap().to_string(),
                        dial_code: document.get_str("dial_code").unwrap().to_string(),
                        currency: document.get_str("currency").unwrap().to_string(),
                        currency_symbol: document.get_str("currency_symbol").unwrap().to_string(),
                        flag_url: document.get_str("flag_url").unwrap().to_string(),
                        language_id: document.get_str("language_id").unwrap().to_string(),
                    };
                    countries.push(country);
                }
                Err(_) => return Err(Status::internal(t!("countries_not_found"))),
            }
        }


        // create response
        let response = GetCountriesResponse {
            countries,
        };

        Ok(Response::new(response))
    }

    // done
    async fn get_country_by_id(&self, request: Request<String>) -> Result<Response<Country>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col).await {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get country id from request
        let country_id = request.into_inner();

        // get country from database
        let country_doc = match self.country_col.find_one(doc! {"id": &country_id}, None).await.unwrap() {
            Some(country_doc) => country_doc,
            None => {
                log::error!("{}: {:?}", t!("country_not_found"), &country_id);
                return Err(Status::not_found(t!("country_not_found")));
            }
        };

        // create country
        let country = Country {
            id: country_doc.get_str("id").unwrap().to_string(),
            name: country_doc.get_str("name").unwrap().to_string(),
            code: country_doc.get_str("code").unwrap().to_string(),
            dial_code: country_doc.get_str("dial_code").unwrap().to_string(),
            currency: country_doc.get_str("currency").unwrap().to_string(),
            currency_symbol: country_doc.get_str("currency_symbol").unwrap().to_string(),
            flag_url: country_doc.get_str("flag_url").unwrap().to_string(),
            language_id: country_doc.get_str("language_id").unwrap().to_string(),
        };

        Ok(Response::new(country))
    }

    // done
    async fn add_country(&self, request: Request<Country>) -> Result<Response<Country>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get country from request
        let mut country = request.into_inner();

        // check if country already exists
        match self.country_col.find_one(doc! {"code": &country.code}, None).await.unwrap() {
            Some(_) => {
                log::error!("{}: {:?}", t!("country_already_exists"), &country.code);
                return Err(Status::already_exists(t!("country_already_exists")));
            }
            None => (),
        };

        // create country document
        let re = Regex::new(r"[^a-zA-Z0-9\s]+").unwrap();
        let id_builder = re.replace_all(&country.dial_code, "").to_string();
        country.id = format!("{}-{}-{}", &country.code.to_lowercase(), utils::generators::generate_random_string(17), id_builder).to_string();
        let country_doc = doc! {
            "id": &country.id,
            "name": &country.name,
            "code": &country.code,
            "dial_code": &country.dial_code,
            "currency": &country.currency,
            "currency_symbol": &country.currency_symbol,
            "flag_url": &country.flag_url,
            "language_id": &country.language_id,
        };

        // insert country into database
        match self.country_col.insert_one(country_doc, None).await {
            Ok(_) => {
                // get country from database
                let country_doc = match self.country_col.find_one(doc! {"id": &country.id}, None).await.unwrap() {
                    Some(country_doc) => country_doc,
                    None => {
                        log::error!("{}: {:?}", t!("country_not_found"), &country.id);
                        return Err(Status::not_found(t!("country_not_found")));
                    }
                };

                // create country
                country = Country {
                    id: country_doc.get_str("id").unwrap().to_string(),
                    name: country_doc.get_str("name").unwrap().to_string(),
                    code: country_doc.get_str("code").unwrap().to_string(),
                    dial_code: country_doc.get_str("dial_code").unwrap().to_string(),
                    currency: country_doc.get_str("currency").unwrap().to_string(),
                    currency_symbol: country_doc.get_str("currency_symbol").unwrap().to_string(),
                    flag_url: country_doc.get_str("flag_url").unwrap().to_string(),
                    language_id: country_doc.get_str("language_id").unwrap().to_string(),
                };

                Ok(Response::new(country.to_owned()))
            }
            Err(e) => {
                log::error!("{}: {:?}", t!("country_not_added"), e);
                Err(Status::internal(t!("country_not_added")))
            }
        }
    }

    // done
    async fn delete_country(&self, request: Request<String>) -> Result<Response<()>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token"), e);
                return Err(Status::unauthenticated(t!("invalid_token")));
            }
        };

        // get country id from request
        let country_id = request.into_inner();

        // delete country from database
        match self.country_col.delete_one(doc! {"id": &country_id}, None).await {
            Ok(_) => Ok(Response::new(())),
            Err(e) => {
                log::error!("{}: {:?}", t!("country_not_deleted"), e);
                Err(Status::internal(t!("country_not_deleted")))
            }
        }
    }
}

// create timestamp field
#[inline]
fn _create_timestamp_field() -> String {
    Utc::now().to_rfc3339()
}

// parse timestamp field
fn _parse_timestamp_field(timestamp: &Bson) -> Option<prost_types::Timestamp> {
    let parsed = match DateTime::parse_from_rfc3339(timestamp.as_str().unwrap()) {
        Ok(result) => result,
        Err(_) => {
            return None;
        }
    };
    Some(prost_types::Timestamp {
        seconds: parsed.timestamp_millis(),
        nanos: 0,
    })
}

// validate language id
fn _validate_language_id_from_request(md: &MetadataMap) -> Result<String, Status> {
    let language_id = match md.get("x-language-id") {
        Some(result) => result.to_str().unwrap().to_string(),
        None => {
            return Err(Status::invalid_argument(t!("invalid_language_code")));
        }
    };
    // validate language id from request
    match locale::validate_language_id(&language_id) {
        Ok(_) => {
            rust_i18n::set_locale(&language_id);
            Ok(language_id)
        }
        Err(_) => {
            return Err(Status::invalid_argument(t!("invalid_language_code")));
        }
    }
}

// get authentication type from metadata
fn _get_authentication_type_from_metadata(md: &MetadataMap) -> Result<bool, Status> {
    let authentication_type = match md.get("x-authenticated") {
        Some(result) => result.to_str().unwrap().to_string(),
        None => {
            return Err(Status::invalid_argument(t!("invalid_token")));
        }
    };
    Ok(authentication_type == "true")
}