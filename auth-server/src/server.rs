use mongodb::bson::{doc, Document};
use rust_i18n::t;
use tonic::{async_trait, Request, Response, Status};

use crate::config;
use crate::config::tokenizer;
use crate::proto::{Account, AuthResponse, LoginRequest, RegisterRequest, ResetPasswordRequest, Session, VerifyPhoneRequest};
use crate::proto::auth_service_server::AuthService;

rust_i18n::i18n!("locales");

pub struct AuthServiceImpl {
    pub account_col: mongodb::Collection<Document>,
    pub session_col: mongodb::Collection<Document>,
}

impl AuthServiceImpl {
    pub fn new(account_col: mongodb::Collection<Document>, session_col: mongodb::Collection<Document>) -> Self {
        Self {
            account_col,
            session_col,
        }
    }
}

#[tonic::async_trait]
impl AuthService for AuthServiceImpl {
    async fn login(&self, request: Request<LoginRequest>) -> Result<Response<AuthResponse>, Status> {
        // start login
        log::info!("{}", t!("auth_started"));

        // parse request
        let mut req = request.into_inner();

        // validate language id from request
        let valid = match config::locale::validate_language_id(&req.language_id) {
            Ok(_) => true,
            Err(_) => false
        };
        if !valid {
            return Err(Status::invalid_argument(t!("invalid_language_id")));
        }

        // set locale
        rust_i18n::set_locale(&req.language_id);

        // get account from db
        let mut account = match self.account_col.find_one(doc! {"phone_number": &req.phone_number}, None).await {
            Ok(account) => account,
            Err(e) => {
                log::error!("{}: {:?}", t!("account_not_found"), e);
                return Err(Status::not_found(t!("account_not_found")));
            }
        };

        // create a new session for account
        match account {
            Some(mut account_doc) => {
                log::info!("{}: {:?}", t!("account_found"), &account_doc);

                // generate session
                let mut session_doc = config::session_manager::create_session_for_account(&account_doc, &self.session_col).await.unwrap();
                let session = Session {
                    id: session_doc.get("id").unwrap().to_string(),
                    account_id: session_doc.get("account_id").unwrap().to_string(),
                    access_token: session_doc.get("access_token").unwrap().to_string(),
                    refresh_token: session_doc.get("refresh_token").unwrap().to_string(),
                    language_id: session_doc.get("language_id").unwrap().to_string(),
                    created_at: None,
                    access_token_expires_at: None,
                    refresh_token_expires_at: None,
                };

                Ok(Response::new(AuthResponse {
                    session: Some(session),
                }))
            }
            None => {
                log::error!("{}: {:?}", t!("account_not_found"), &account);
                return Err(Status::not_found(t!("account_not_found")));
            }
        }
    }

    async fn register(&self, _: Request<RegisterRequest>) -> Result<Response<AuthResponse>, Status> {
        todo!()
    }

    async fn reset_password(&self, _: Request<ResetPasswordRequest>) -> Result<Response<AuthResponse>, Status> {
        todo!()
    }

    async fn refresh_token(&self, _: Request<()>) -> Result<Response<AuthResponse>, Status> {
        todo!()
    }

    async fn logout(&self, _: Request<()>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn get_account(&self, _: Request<()>) -> Result<Response<Account>, Status> {
        todo!()
    }

    async fn get_account_by_phone_number(&self, _: Request<String>) -> Result<Response<Account>, Status> {
        todo!()
    }

    async fn update_account(&self, _: Request<Account>) -> Result<Response<Account>, Status> {
        todo!()
    }

    async fn delete_account(&self, _: Request<()>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn get_session(&self, _: Request<()>) -> Result<Response<Session>, Status> {
        todo!()
    }

    async fn update_session(&self, _: Request<Session>) -> Result<Response<Session>, Status> {
        todo!()
    }

    async fn delete_session(&self, _: Request<()>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn get_referral_code(&self, _: Request<()>) -> Result<Response<String>, Status> {
        todo!()
    }

    async fn get_referral_code_by_phone_number(&self, _: Request<String>) -> Result<Response<String>, Status> {
        todo!()
    }

    async fn send_phone_verification_code(&self, _: Request<String>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn verify_phone_verification_code(&self, _: Request<VerifyPhoneRequest>) -> Result<Response<()>, Status> {
        todo!()
    }
}

