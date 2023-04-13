use chrono::{DateTime, Utc};
use mongodb::bson::{Bson, bson, doc, Document};
use rust_i18n::t;
use tonic::{async_trait, Request, Response, Status};
use tonic::metadata::MetadataMap;

use crate::config;
use crate::config::{locale, tokenizer};
use crate::proto::{Account, LoginRequest, RegisterRequest, ResetPasswordRequest, ValidateAccessTokenResponse, VerifyPhoneRequest};
use crate::proto::auth_service_server::AuthService;

rust_i18n::i18n!("locales");

pub struct AuthServiceImpl {
    pub account_col: mongodb::Collection<Document>,
    pub token_col: mongodb::Collection<Document>,
}

impl AuthServiceImpl {
    pub fn new(account_col: mongodb::Collection<Document>, session_col: mongodb::Collection<Document>) -> Self {
        Self {
            account_col,
            token_col: session_col,
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
            "created_at" : &Utc::now().to_rfc3339(),
            "updated_at" : &Utc::now().to_rfc3339(),    // aka: last login
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
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id).await {
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
            account_id: account_doc.get_str("id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            display_name: account_doc.get_str("display_name").unwrap().to_string(),
        }))
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

        // parse `created_at` date
        let created_at_parsed = match DateTime::parse_from_rfc3339(&account_doc.get("created_at").unwrap().as_str().unwrap().to_string()) {
            Ok(result) => result,
            Err(e) => {
                log::error!("{}: {:?}", t!("auth_failed"), e);
                return Err(Status::internal(t!("auth_failed")));
            }
        };

        // parse `updated_at` date
        let updated_at_parsed = match DateTime::parse_from_rfc3339(&account_doc.get("created_at").unwrap().as_str().unwrap().to_string()) {
            Ok(result) => result,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_updated_at"), e);
                return Err(Status::internal(t!("invalid_updated_at")));
            }
        };

        // create account object from account doc
        let account = Account {
            id: account_doc.get_str("id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            referral_code: Some(account_doc.get_str("referral_code").unwrap().to_string()),
            language_id: language_id.to_string(),
            created_at: Some(prost_types::Timestamp {
                seconds: created_at_parsed.timestamp_millis(),
                nanos: 0,
            }),
            updated_at: Some(
                prost_types::Timestamp {
                    seconds: updated_at_parsed.timestamp_millis(),
                    nanos: 0,
                }
            ),
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

        // parse `created_at` date
        let created_at_parsed = match DateTime::parse_from_rfc3339(&account_doc.get("created_at").unwrap().as_str().unwrap().to_string()) {
            Ok(result) => result,
            Err(e) => {
                log::error!("{}: {:?}", t!("auth_failed"), e);
                return Err(Status::internal(t!("auth_failed")));
            }
        };

        // parse `updated_at` date
        let updated_at_parsed = match DateTime::parse_from_rfc3339(&account_doc.get("created_at").unwrap().as_str().unwrap().to_string()) {
            Ok(result) => result,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_updated_at"), e);
                return Err(Status::internal(t!("invalid_updated_at")));
            }
        };

        // create account object from account doc
        let account = Account {
            id: account_doc.get_str("id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            referral_code: Some(account_doc.get_str("referral_code").unwrap().to_string()),
            language_id: language_id.to_string(),
            created_at: Some(prost_types::Timestamp {
                seconds: created_at_parsed.timestamp_millis(),
                nanos: 0,
            }),
            updated_at: Some(
                prost_types::Timestamp {
                    seconds: updated_at_parsed.timestamp_millis(),
                    nanos: 0,
                }
            ),
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
            "updated_at": Utc::now().to_rfc3339(),
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

        // parse created_at and updated_at fields
        let created_at_parsed = match DateTime::parse_from_rfc3339(account_doc.get_str("created_at").unwrap()) {
            Ok(created_at) => created_at,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_created_at"), e);
                return Err(Status::internal(t!("invalid_created_at")));
            }
        };
        let updated_at_parsed = match DateTime::parse_from_rfc3339(account_doc.get_str("updated_at").unwrap()) {
            Ok(updated_at) => updated_at,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_updated_at"), e);
                return Err(Status::internal(t!("invalid_updated_at")));
            }
        };

        // create account object to return
        let account = Account {
            id: account_doc.get_str("id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            created_at: Some(
                prost_types::Timestamp {
                    seconds: created_at_parsed.timestamp(),
                    nanos: 0,
                }
            ),
            updated_at: Some(
                prost_types::Timestamp {
                    seconds: updated_at_parsed.timestamp(),
                    nanos: 0,
                }
            ),
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
}

// create timestamp field
fn _create_timestamp_field() -> Bson {
    let current_time = Utc::now();
    let timestamp = DateTime::<Utc>::from(current_time).timestamp();
    bson!({ "$timestamp": { "t": timestamp as i32, "i": 0 } })
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
        Ok(_) => Ok(language_id),
        Err(_) => {
            return Err(Status::invalid_argument(t!("invalid_language_code")));
        }
    }
}