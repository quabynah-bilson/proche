use mongodb::bson::{doc, Document};
use rust_i18n::t;
use tonic::{async_trait, Request, Response, Status};

use crate::config;
use crate::config::{locale, tokenizer};
use crate::proto::{Account, LoginRequest, RegisterRequest, ResetPasswordRequest, VerifyPhoneRequest};
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

        // parse request
        let req = request.into_inner();

        // validate language id from request
        match locale::validate_language_id(&req.language_id) {
            Ok(_) => (),
            Err(e) => {
                return Err(Status::invalid_argument(t!("invalid_language_id")));
            }
        };

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
                let access_token = config::session_manager::create_access_token(&account_doc.get_str("id").unwrap().to_string(), &req.language_id, &self.token_col).await.unwrap();
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

        // parse request
        let req = request.into_inner();

        // validate language id from request
        match locale::validate_language_id(&req.language_id) {
            Ok(_) => (),
            Err(e) => {
                return Err(Status::invalid_argument(t!("invalid_language_id")));
            }
        };

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
            "language_id" : &req.language_id,
            "avatar_url" : &req.avatar_url.unwrap(),
            "id_card_url" : &req.id_card_url.unwrap(),
            "vaccine_card_url" : &req.vaccine_card_url.unwrap(),
            "referral_code" : &req.referral_code.unwrap(),
            "password" : &hashed_password,
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
                let access_token = config::session_manager::create_access_token(&account_doc.get_str("id").unwrap().to_string(), &req.language_id, &self.token_col).await.unwrap();
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
        let req = request.into_inner();
        // validate language id from request
        match locale::validate_language_id(&req.language_id) {
            Ok(_) => (),
            Err(e) => {
                return Err(Status::invalid_argument(t!("invalid_language_id")));
            }
        };

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
                let access_token = config::session_manager::create_access_token(&account_doc.get_str("id").unwrap().to_string(), &req.language_id, &self.token_col).await.unwrap();
                Ok(Response::new(access_token))
            }
            Err(e) => {
                log::error!("{}: {:?}", t!("password_reset_failed"), e);
                return Err(Status::internal(t!("password_reset_failed")));
            }
        }
    }

    async fn logout(&self, request: Request<()>) -> Result<Response<()>, Status> {
        match config::session_manager::clear_access_token(&request.metadata(), &self.token_col).await {
            Ok(()) => Ok(Response::new(())),
            Err(e) => {
                log::error!("{}: {:?}", t!("logout_failed"), e);
                return Err(Status::internal(t!("logout_failed")));
            }
        }
    }

    async fn get_account(&self, request: Request<()>) -> Result<Response<Account>, Status> {
        todo!()
    }

    async fn get_account_by_phone_number(&self, request: Request<String>) -> Result<Response<Account>, Status> {
        todo!()
    }

    async fn update_account(&self, request: Request<Account>) -> Result<Response<Account>, Status> {
        todo!()
    }

    async fn delete_account(&self, request: Request<()>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn get_referral_code(&self, request: Request<()>) -> Result<Response<String>, Status> {
        todo!()
    }

    async fn get_referral_code_by_phone_number(&self, request: Request<String>) -> Result<Response<String>, Status> {
        todo!()
    }

    async fn send_phone_verification_code(&self, request: Request<String>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn verify_phone_verification_code(&self, request: Request<VerifyPhoneRequest>) -> Result<Response<()>, Status> {
        todo!()
    }
}

// check if language id is supported
fn _check_supported_language(language_id: &str) -> Result<(), Status> {
    // validate language id from request
    let valid = match config::locale::validate_language_id(&language_id) {
        Ok(_) => true,
        Err(_) => false
    };
    if !valid {
        return Err(Status::invalid_argument(t!("invalid_language_id")));
    }

    // set locale
    rust_i18n::set_locale(&language_id);
    Ok(())
}
