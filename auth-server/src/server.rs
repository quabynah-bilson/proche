use tonic::{Request, Response, Status};

use crate::proto::{Account, AuthResponse, LoginRequest, RegisterRequest, ResetPasswordRequest, Session, VerifyPhoneRequest};
use crate::proto::auth_service_server::AuthService;

pub struct AuthServiceImpl {
    pub account_col: mongodb::Collection<Account>,
    pub session_col: mongodb::Collection<Session>,
}

impl AuthServiceImpl {
    pub fn new(account_col: mongodb::Collection<Account>, session_col: mongodb::Collection<Session>) -> Self {
        Self {
            account_col,
            session_col,
        }
    }
}

#[tonic::async_trait]
impl AuthService for AuthServiceImpl {
    async fn login(&self, _: Request<LoginRequest>) -> Result<Response<AuthResponse>, Status> {
        todo!()
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
