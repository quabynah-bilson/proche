use std::error::Error;

use chrono::{DateTime, Utc};
use futures::StreamExt;
use mongodb::bson::{Bson, doc, Document};
use mongodb::options::FindOptions;
use regex::Regex;
use rust_i18n::t;
use tonic::{async_trait, Request, Response, Status};
use tonic::metadata::MetadataMap;

use crate::{client, config, utils};
use crate::config::{locale, tokenizer};
use crate::proto::{Account, BusinessAccount, Country, CreateBusinessAccountRequest, GetCountriesResponse, LoginRequest, MediaType, RegisterRequest, ResetPasswordRequest, UploadMediaRequest, ValidateAccessTokenResponse};
use crate::proto::auth_service_server::AuthService;

rust_i18n::i18n!("locales");

pub struct AuthServiceImpl {
    pub account_col: mongodb::Collection<Document>,
    pub business_account_col: mongodb::Collection<Document>,
    pub token_col: mongodb::Collection<Document>,
    pub country_col: mongodb::Collection<Document>,
}

impl AuthServiceImpl {
    pub fn new(
        account_col: mongodb::Collection<Document>,
        business_account_col: mongodb::Collection<Document>,
        token_col: mongodb::Collection<Document>,
        country_col: mongodb::Collection<Document>,
    ) -> Self {
        Self {
            account_col,
            business_account_col,
            token_col,
            country_col,
        }
    }
}

#[async_trait]
impl AuthService for AuthServiceImpl {
    // done
    async fn login(&self, request: Request<LoginRequest>) -> Result<Response<String>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id)
            .await
        {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        // parse request
        let req = request.into_inner();

        // get account from db
        let account = match self
            .account_col
            .find_one(doc! {"phone_number": req.phone_number}, None)
            .await
        {
            Ok(account) => account,
            Err(_) => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // create a new session for account
        match account {
            Some(account_doc) => {
                // compare password
                let is_valid_password = match tokenizer::compare_password(
                    &req.password,
                    &account_doc.get_str("password").unwrap().to_string(),
                ) {
                    Ok(is_valid) => is_valid,
                    Err(_) => {
                        return Err(Status::unauthenticated(t!("invalid_credentials")));
                    }
                };
                if !is_valid_password {
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
                    Err(_) => false,
                };
                if !is_valid_country {
                    return Err(Status::unauthenticated(t!("invalid_credentials")));
                }

                // generate access token
                let access_token = config::session_manager::create_access_token(
                    &account_doc.get_str("id").unwrap().to_string(),
                    &language_id,
                    &self.token_col,
                )
                    .await
                    .unwrap();
                Ok(Response::new(access_token))
            }
            None => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        }
    }

    // done
    async fn register(
        &self,
        request: Request<RegisterRequest>,
    ) -> Result<Response<String>, Status> {

        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id)
            .await
        {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        // parse request
        let req = request.into_inner();

        // get account from db
        let has_existing_account = match self
            .account_col
            .find_one(doc! {"phone_number": &req.phone_number}, None)
            .await
            .unwrap()
        {
            Some(_) => {
                true
            }
            None => false,
        };
        if has_existing_account {
            return Err(Status::already_exists(t!("account_exists")));
        }

        // encrypt password
        let hashed_password = match tokenizer::hash_password(&req.password) {
            Ok(hashed_password) => hashed_password,
            Err(_) => {
                return Err(Status::internal(t!("password_encryption_failed")));
            }
        };

        // upload profile picture
        let avatar = match req.avatar_url {
            Some(avatar_url) => {
                let avatar = match _upload_media(&avatar_url, &req.phone_number, "avatar").await {
                    Ok(avatar) => avatar,
                    Err(_) => "".to_string(),
                };
                avatar
            }
            None => "".to_string(),
        };

        // create a new account
        let mut account_doc = doc! {
            "phone_number" : &req.phone_number,
            "display_name" : &req.display_name,
            "language_id" : &language_id,
            "avatar_url" : avatar,
            "id_card_url" : &req.id_card_url.unwrap_or("".to_string()),
            "vaccine_card_url" : &req.vaccine_card_url.unwrap_or("".to_string()),
            "referral_code" : &req.referral_code.unwrap_or("".to_string()),
            "password" : &hashed_password,
            "country_id" : &req.country_id,
            "is_verified" : Some(false),
            "is_public_account" : Some(true),
            "created_at": _create_timestamp_field(),
            "updated_at": _create_timestamp_field(),    // aka: last login
        };

        // save account to db
        match self
            .account_col
            .insert_one(&account_doc.clone(), None)
            .await
        {
            Ok(result) => {
                // update id field with result
                account_doc.insert("id", &result.inserted_id.as_object_id().unwrap().to_hex());

                // replace one in db with updated account doc
                match self
                    .account_col
                    .replace_one(doc! {"phone_number": &req.phone_number}, &account_doc, None)
                    .await
                {
                    Ok(_) => (),
                    Err(_) => {
                        return Err(Status::internal(t!("auth_failed")));
                    }
                }

                // create a new access token
                let access_token = config::session_manager::create_access_token(
                    &account_doc.get_str("id").unwrap().to_string(),
                    &language_id,
                    &self.token_col,
                )
                    .await
                    .unwrap();
                Ok(Response::new(access_token))
            }
            Err(_) => {
                return Err(Status::internal(t!("auth_failed")));
            }
        }
    }

    // done
    async fn reset_password(
        &self,
        request: Request<ResetPasswordRequest>,
    ) -> Result<Response<String>, Status> {
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id)
            .await
        {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        // get request
        let req = request.into_inner();

        // find account by phone number
        let mut account_doc = match self
            .account_col
            .find_one(doc! {"phone_number": &req.phone_number}, None)
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // encrypt password
        let hashed_password = match tokenizer::hash_password(&req.password) {
            Ok(hashed_password) => hashed_password,
            Err(_) => {
                return Err(Status::internal(t!("password_encryption_failed")));
            }
        };

        // update password
        account_doc.insert("password", &hashed_password);

        // replace one in db with updated account doc
        match self
            .account_col
            .replace_one(doc! {"phone_number": &req.phone_number}, &account_doc, None)
            .await
        {
            Ok(_) => {
                // create access token
                let access_token = config::session_manager::create_access_token(
                    &account_doc.get_str("id").unwrap().to_string(),
                    &language_id,
                    &self.token_col,
                )
                    .await
                    .unwrap();
                Ok(Response::new(access_token))
            }
            Err(_) => {
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
        match config::session_manager::verify_access_token(
            &request.metadata(),
            &language_id,
            &self.token_col,
        )
            .await
        {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        match config::session_manager::clear_access_token(&request.metadata(), &self.token_col)
            .await
        {
            Ok(()) => Ok(Response::new(())),
            Err(e) => {
                return Err(e);
            }
        }
    }

    async fn verify_password(&self, request: Request<String>) -> Result<Response<()>, Status> {
        // validate language id
        match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify access token
        let token_payload = match config::session_manager::verify_access_token(
            &request.metadata(),
            &rust_i18n::locale().as_str().to_string(),
            &self.token_col,
        )
            .await
        {
            Ok(result) => (result.0, result.1),
            Err(e) => {
                return Err(e);
            }
        };

        // get account id from token payload and language id
        let account_id = token_payload.0;

        // find account by id
        let account_doc = match self
            .account_col
            .find_one(doc! {"id": &account_id}, None)
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // get password from request
        let password = request.into_inner();

        // verify password
        match tokenizer::compare_password(&password, &account_doc.get_str("password").unwrap()) {
            Ok(_) => Ok(Response::new(())),
            Err(_) => {
                return Err(Status::internal(t!("invalid_credentials")));
            }
        }
    }

    // done
    async fn request_public_access_token(
        &self,
        _: Request<()>,
    ) -> Result<Response<String>, Status> {
        // generate a new public token from tokenizer
        match tokenizer::generate_public_token(&rust_i18n::locale()) {
            // return token if successful else return status internal
            Ok(token) => Ok(Response::new(token)),
            Err(_) => {
                Err(Status::internal(t!("access_denied")))
            }
        }
    }

    // done
    async fn validate_access_token(
        &self,
        request: Request<()>,
    ) -> Result<Response<ValidateAccessTokenResponse>, Status> {
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
            let token = match config::session_manager::verify_access_token(
                &request.metadata(),
                &language_id,
                &self.token_col,
            )
                .await
            {
                Ok(token) => token,
                Err(e) => {
                    return Err(e);
                }
            };

            // get account by id
            let account_doc = match self
                .account_col
                .find_one(doc! {"id": &token.0}, None)
                .await
                .unwrap()
            {
                Some(acct_doc) => acct_doc,
                None => {
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
            match config::session_manager::verify_public_access_token(
                &request.metadata(),
                &language_id,
            )
                .await
            {
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
        let token_payload = match config::session_manager::verify_access_token(
            &request.metadata(),
            &rust_i18n::locale().as_str().to_string(),
            &self.token_col,
        )
            .await
        {
            Ok(result) => (result.0, result.1),
            Err(e) => {
                return Err(e);
            }
        };

        // get account id from token payload and language id
        let account_id = token_payload.0;
        let language_id = token_payload.1;

        // find account by id
        let account_doc = match self
            .account_col
            .find_one(doc! {"id": &account_id}, None)
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // create account object from account doc
        let account = Account {
            id: account_doc.get_str("id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            country_id: account_doc
                .get_str("country_id")
                .unwrap_or("en-proche-233")
                .to_string(),
            referral_code: Some(account_doc.get_str("referral_code").unwrap().to_string()),
            language_id: language_id.to_string(),
            created_at: _parse_timestamp_field(account_doc.get("created_at").unwrap()),
            updated_at: _parse_timestamp_field(account_doc.get("updated_at").unwrap()),
            avatar_url: Some(account_doc.get_str("avatar_url").unwrap_or("").to_string()),
            id_card_url: Some(account_doc.get_str("id_card").unwrap_or("").to_string()),
            display_name: account_doc
                .get_str("display_name")
                .unwrap_or("")
                .to_string(),
            vaccine_card_url: Some(
                account_doc
                    .get_str("vaccine_card")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_id: Some(
                account_doc
                    .get_str("device_id")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_type: Some(
                account_doc
                    .get_str("device_type")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_token: Some(
                account_doc
                    .get_str("device_token")
                    .unwrap_or("")
                    .to_string(),
            ),
            is_verified: Some(account_doc.get_bool("is_verified").unwrap_or(false)),
            is_public_account: Some(account_doc.get_bool("is_public_account").unwrap_or(true)),
        };

        Ok(Response::new(account))
    }

    // done
    async fn get_account_by_phone_number(
        &self,
        request: Request<String>,
    ) -> Result<Response<Account>, Status> {
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id)
            .await
        {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        // find account by phone number
        let phone_number = request.into_inner();
        let account_doc = match self
            .account_col
            .find_one(doc! {"phone_number": &phone_number}, None)
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
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
            avatar_url: Some(account_doc.get_str("avatar_url").unwrap_or("").to_string()),
            id_card_url: Some(account_doc.get_str("id_card").unwrap_or("").to_string()),
            display_name: account_doc
                .get_str("display_name")
                .unwrap_or("")
                .to_string(),
            vaccine_card_url: Some(
                account_doc
                    .get_str("vaccine_card")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_id: Some(
                account_doc
                    .get_str("device_id")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_type: Some(
                account_doc
                    .get_str("device_type")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_token: Some(
                account_doc
                    .get_str("device_token")
                    .unwrap_or("")
                    .to_string(),
            ),
            is_verified: Some(account_doc.get_bool("is_verified").unwrap_or(false)),
            is_public_account: Some(account_doc.get_bool("is_public_account").unwrap_or(true)),
        };

        Ok(Response::new(account))
    }

    async fn get_account_by_id(&self, request: Request<String>) -> Result<Response<Account>, Status> {
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // verify public token
        match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col)
            .await
        {
            Ok(_) => (),
            Err(e) => {
                return Err(e);
            }
        };

        // find account by id
        let id = request.into_inner();
        let account_doc = match self
            .account_col
            .find_one(doc! {"id": &id}, None)
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
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
            avatar_url: Some(account_doc.get_str("avatar_url").unwrap_or("").to_string()),
            id_card_url: Some(account_doc.get_str("id_card").unwrap_or("").to_string()),
            display_name: account_doc
                .get_str("display_name")
                .unwrap_or("")
                .to_string(),
            vaccine_card_url: Some(
                account_doc
                    .get_str("vaccine_card")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_id: Some(
                account_doc
                    .get_str("device_id")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_type: Some(
                account_doc
                    .get_str("device_type")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_token: Some(
                account_doc
                    .get_str("device_token")
                    .unwrap_or("")
                    .to_string(),
            ),
            is_verified: Some(account_doc.get_bool("is_verified").unwrap_or(false)),
            is_public_account: Some(account_doc.get_bool("is_public_account").unwrap_or(true)),
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
        match config::session_manager::verify_access_token(
            &request.metadata(),
            &language_id,
            &self.token_col,
        )
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // extract account object from request
        let account = request.into_inner();

        // perform account update with account object from request
        match self
            .account_col
            .find_one_and_update(
                doc! {"id": &account.id},
                doc! {"$set": {
                    "display_name": &account.display_name,
                    "avatar_url": &account.avatar_url.unwrap(),
                    "id_card": &account.id_card_url.unwrap(),
                    "vaccine_card": &account.vaccine_card_url.unwrap(),
                    "updated_at": _create_timestamp_field(),
                    "country_id" : &account.country_id,
                    "device_id" : &account.device_id.unwrap(),
                    "device_type" : &account.device_type.unwrap(),
                    "device_token" : &account.device_token.unwrap(),
                    "is_verified" : &account.is_verified.unwrap(),
                    "is_public_account" : &account.is_public_account.unwrap(),
                }},
                None,
            )
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // get the updated account document
        let account_doc = match self
            .account_col
            .find_one(doc! {"id": &account.id}, None)
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
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
            avatar_url: Some(account_doc.get_str("avatar_url").unwrap_or("").to_string()),
            id_card_url: Some(account_doc.get_str("id_card").unwrap_or("").to_string()),
            display_name: account_doc
                .get_str("display_name")
                .unwrap_or("")
                .to_string(),
            vaccine_card_url: Some(
                account_doc
                    .get_str("vaccine_card")
                    .unwrap_or("")
                    .to_string(),
            ),
            language_id,
            referral_code: Some(
                account_doc
                    .get_str("referral_code")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_id: Some(
                account_doc
                    .get_str("device_id")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_type: Some(
                account_doc
                    .get_str("device_type")
                    .unwrap_or("")
                    .to_string(),
            ),
            device_token: Some(
                account_doc
                    .get_str("device_token")
                    .unwrap_or("")
                    .to_string(),
            ),
            is_verified: Some(account_doc.get_bool("is_verified").unwrap_or(false)),
            is_public_account: Some(account_doc.get_bool("is_public_account").unwrap_or(true)),
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
        let token = match config::session_manager::verify_access_token(
            &request.metadata(),
            &language_id,
            &self.token_col,
        )
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // delete account using account id from token payload
        match self
            .account_col
            .delete_one(doc! {"id": &token.0}, None)
            .await
        {
            Ok(_) => Ok(Response::new(())),
            Err(_) => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        }
    }

    // done
    async fn get_business_account(&self, request: Request<String>) -> Result<Response<BusinessAccount>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col)
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        let id = request.into_inner();

        // get country from database
        let business_doc = match self
            .business_account_col
            .find_one(doc! {"id": &id}, None)
            .await
            .unwrap()
        {
            Some(business_doc) => business_doc,
            None => {
                return Err(Status::not_found(t!("business_not_found")));
            }
        };

        // create business model
        let account_doc = business_doc.get_document("owner").unwrap();
        let business = BusinessAccount {
            owner: Some(
                Account {
                    id: account_doc.get_str("id").unwrap().to_string(),
                    phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
                    country_id: account_doc
                        .get_str("country_id")
                        .unwrap_or("en-proche-233")
                        .to_string(),
                    language_id: language_id.to_string(),
                    display_name: account_doc
                        .get_str("display_name")
                        .unwrap_or("")
                        .to_string(),
                    avatar_url: Some(account_doc.get_str("avatar_url").unwrap_or("").to_string()),
                    is_verified: Some(account_doc.get_bool("is_verified").unwrap_or(false)),
                    referral_code: None,
                    created_at: None,
                    updated_at: None,
                    id_card_url: None,
                    vaccine_card_url: None,
                    device_id: None,
                    device_type: None,
                    device_token: None,
                    is_public_account: None,
                }
            ),
            specialization: business_doc.get_str("specialization").unwrap().to_string(),
            jobs_completed: business_doc.get_i32("jobs_completed").unwrap_or(0),
            hourly_rate: business_doc.get_f64("hourly_rate").unwrap_or(0.99),
            ratings: business_doc.get_f64("ratings").unwrap_or(3.50),
        };

        Ok(Response::new(business))
    }

    // done
    async fn update_business_account(&self, request: Request<BusinessAccount>) -> Result<Response<BusinessAccount>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col)
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // extract account object from request
        let account = request.into_inner();
        let owner = account.clone().owner.unwrap();

        // perform account update with account object from request
        match self
            .business_account_col
            .find_one_and_update(
                doc! {"id": &owner.id},
                doc! {"$set": {
                    "specialization": &account.specialization,
                    "jobs_completed": &account.jobs_completed,
                    "hourly_rate": &account.hourly_rate,
                    "ratings" : &account.ratings,
                }},
                None,
            )
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
                return Err(Status::not_found(t!("business_account_not_found")));
            }
        };

        Ok(Response::new(account))
    }

    // done
    async fn delete_business_account(&self, request: Request<String>) -> Result<Response<()>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col)
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // delete account using account id from token payload
        match self
            .business_account_col
            .delete_one(doc! {"id": request.into_inner()}, None)
            .await
        {
            Ok(_) => Ok(Response::new(())),
            Err(_) => {
                return Err(Status::not_found(t!("business_account_not_found")));
            }
        }
    }

    // done
    async fn create_business_account(&self, request: Request<CreateBusinessAccountRequest>) -> Result<Response<BusinessAccount>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col)
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        let req = request.into_inner();
        let id = &req.account_id;

        let has_existing_account = match self
            .business_account_col
            .find_one(doc! {"id": &id}, None)
            .await
            .unwrap()
        {
            Some(_) => {
                true
            }
            None => false,
        };
        if has_existing_account {
            return Err(Status::already_exists(t!("business_account_exists")));
        }

        // get account
        let account_doc = match self.account_col.find_one(doc! {"id" : &id}, None).await {
            Ok(doc) => match doc {
                Some(doc) => doc,
                None => {
                    return Err(Status::not_found(t!("account_not_found", locale=&language_id)));
                }
            }
            Err(_) => {
                return Err(Status::not_found(t!("account_not_found", locale=&language_id)));
            }
        };

        let account = Account {
            id: account_doc.get_str("id").unwrap().to_string(),
            phone_number: account_doc.get_str("phone_number").unwrap().to_string(),
            country_id: account_doc
                .get_str("country_id")
                .unwrap_or("en-proche-233")
                .to_string(),
            language_id: language_id.to_string(),
            display_name: account_doc
                .get_str("display_name")
                .unwrap_or("")
                .to_string(),
            avatar_url: Some(account_doc.get_str("avatar_url").unwrap_or("").to_string()),
            is_verified: Some(account_doc.get_bool("is_verified").unwrap_or(false)),
            referral_code: None,
            created_at: None,
            updated_at: None,
            id_card_url: None,
            vaccine_card_url: None,
            device_id: None,
            device_type: None,
            device_token: None,
            is_public_account: None,
        };

        let business_account_doc = doc! {
            "id" : &id,
            "owner" : &account_doc.clone(),
            "jobs_completed" : 0,
            "specialization" : &req.specialization,
            "hourly_rate" : &req.hourly_rate,
            "ratings" : 3.55,
            "created_at": _create_timestamp_field(),
            "updated_at": _create_timestamp_field(),
        };

        match self.business_account_col.insert_one(&business_account_doc.clone(), None).await {
            Ok(_) => {
                // FIXME: uncomment this for multi business account support
                // // update id field with result
                // business_account_doc.insert("id", &result.inserted_id.as_object_id().unwrap().to_hex());
                //
                // // replace one in db with updated account doc
                // match self
                //     .business_account_col
                //     .replace_one(doc! {"account.id": &id}, &business_account_doc, None)
                //     .await
                // {
                //     Ok(_) => (),
                //     Err(_) => {
                //         return Err(Status::internal(t!("auth_failed")));
                //     }
                // }


                let business = BusinessAccount {
                    owner: Some(account),
                    specialization: business_account_doc.get_str("specialization").unwrap().to_string(),
                    jobs_completed: business_account_doc.get_i32("jobs_completed").unwrap_or(0),
                    hourly_rate: business_account_doc.get_f64("hourly_rate").unwrap_or(0.99),
                    ratings: business_account_doc.get_f64("ratings").unwrap_or(3.50),
                };

                Ok(Response::new(business))
            }
            Err(_) => {
                return Err(Status::internal(t!("auth_failed")));
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
        let token = match config::session_manager::verify_access_token(
            &request.metadata(),
            &language_id,
            &self.token_col,
        )
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // get account using account id from token payload
        let account_doc = match self
            .account_col
            .find_one(doc! {"id": &token.0}, None)
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc,
            None => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // get referral code from account document
        match account_doc.get_str("referral_code") {
            Ok(referral_code) => Ok(Response::new(referral_code.to_string())),
            Err(_) => {
                return Err(Status::internal(t!("invalid_referral_code")));
            }
        }
    }

    // done
    async fn get_referral_code_by_phone_number(
        &self,
        request: Request<String>,
    ) -> Result<Response<String>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_access_token(
            &request.metadata(),
            &language_id,
            &self.token_col,
        )
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // get phone number from request
        let phone_number = request.into_inner();

        // get referral code using phone number from request
        let referral_code = match self
            .account_col
            .find_one(doc! {"phone_number": &phone_number}, None)
            .await
            .unwrap()
        {
            Some(acct_doc) => acct_doc.get_str("referral_code").unwrap().to_string(),
            None => {
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        Ok(Response::new(referral_code))
    }

    // done
    async fn get_countries(
        &self,
        request: Request<()>,
    ) -> Result<Response<GetCountriesResponse>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        let is_guest = match config::session_manager::verify_public_access_token(&request.metadata(), &language_id)
            .await
        {
            Ok(_) => true,
            Err(_) => false,
        };
        if !is_guest {
            match config::session_manager::verify_access_token(&request.metadata(), &language_id, &self.token_col).await {
                Ok(token) => token.0,
                Err(e) => {
                    return Err(e);
                }
            };
        }

        // get countries from database
        let opts = FindOptions::builder().sort(doc! {"name": 1}).build();
        let mut cursor = match self.country_col.find(None, opts).await {
            Ok(countries) => countries,
            Err(_) => {
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
        let response = GetCountriesResponse { countries };

        Ok(Response::new(response))
    }

    // done
    async fn get_country_by_id(
        &self,
        request: Request<String>,
    ) -> Result<Response<Country>, Status> {
        // validate language id
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        // validate access token
        match config::session_manager::verify_access_token(
            &request.metadata(),
            &language_id,
            &self.token_col,
        )
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // get country id from request
        let country_id = request.into_inner();

        // get country from database
        let country_doc = match self
            .country_col
            .find_one(doc! {"id": &country_id}, None)
            .await
            .unwrap()
        {
            Some(country_doc) => country_doc,
            None => {
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
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id)
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // get country from request
        let mut country = request.into_inner();

        // check if country already exists
        match self
            .country_col
            .find_one(doc! {"code": &country.code}, None)
            .await
            .unwrap()
        {
            Some(_) => {
                return Err(Status::already_exists(t!("country_already_exists")));
            }
            None => (),
        };

        // create country document
        let re = Regex::new(r"[^a-zA-Z0-9\s]+").unwrap();
        let id_builder = re.replace_all(&country.dial_code, "").to_string();
        country.id = format!(
            "{}-{}-{}",
            &country.code.to_lowercase(),
            utils::generators::generate_random_string(17),
            id_builder
        )
            .to_string();
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
                let country_doc = match self
                    .country_col
                    .find_one(doc! {"id": &country.id}, None)
                    .await
                    .unwrap()
                {
                    Some(country_doc) => country_doc,
                    None => {
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
            Err(_) => {
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
        match config::session_manager::verify_public_access_token(&request.metadata(), &language_id)
            .await
        {
            Ok(token) => token,
            Err(e) => {
                return Err(e);
            }
        };

        // get country id from request
        let country_id = request.into_inner();

        // delete country from database
        match self
            .country_col
            .delete_one(doc! {"id": &country_id}, None)
            .await
        {
            Ok(_) => Ok(Response::new(())),
            Err(_) => {
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

// upload base64 avatar using media client
async fn _upload_media(encoded_string: &Vec<u8>, phone_number: &str, name: &str) -> Result<String, Box<dyn Error>> {
    // get client
    let mut client = match client::get_media_client().await {
        Ok(client) => client,
        Err(e) => {
            return Err(format!("{}: {:?}", t!("media_not_uploaded"), e).into());
        }
    };

    // upload media
    let request = UploadMediaRequest {
        name: Some(name.to_string()),
        media: encoded_string.to_vec(),
        owner: Some(phone_number.to_string()),
        r#type: MediaType::Image as i32,
    };
    match client.upload_media(request).await {
        Ok(url) => Ok(url.into_inner()),
        Err(e) => Err(format!("{}: {:?}", t!("media_not_uploaded"), e).into())
    }
}