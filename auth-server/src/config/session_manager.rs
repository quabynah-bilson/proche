use mongodb::bson::{doc, Document};
use tonic::metadata::MetadataMap;
use tonic::Status;

use crate::config::tokenizer;

// create session for account and return it
pub async fn create_access_token(
    account_id: &str,
    language_id: &str,
    token_col: &mongodb::Collection<Document>,
) -> Result<String, Status> {
    // get 10 minutes later timestamp for access token
    let access_token_expires_at = chrono::Utc::now().timestamp() + 600;

    // get 3 days later timestamp for refresh token
    let refresh_token_expires_at = chrono::Utc::now().timestamp() + 259200;

    // generate access token from account id & language id
    let access_token =
        tokenizer::generate_token(&account_id, &language_id, access_token_expires_at).unwrap();
    let refresh_token =
        tokenizer::generate_token(&account_id, &language_id, refresh_token_expires_at).unwrap();

    // create token store
    let doc = doc! {
        "access_token": &access_token,
        "refresh_token": &refresh_token,
    };

    // insert session to db
    match token_col.insert_one(&doc, None).await {
        Ok(_) => Ok(access_token),
        Err(_) => {
            Err(Status::internal(t!("auth_failed")))
        }
    }
}

// get access token from request header
pub async fn verify_access_token(
    request: &MetadataMap,
    language_id: &str,
    token_col: &mongodb::Collection<Document>,
) -> Result<(String, String), Status> {
    // extract token from authorization header
    let access_token = match request.get("Authorization") {
        Some(token) => {
            // remove `Bearer ` from token
            let token = token.to_str().unwrap();
            let token = token.replace("Bearer ", "");
            token
        }
        None => {
            return Err(Status::unauthenticated(t!("access_token_not_found")));
        }
    };
    // validate token extracted and return it if it's valid or can be refreshed else return error
    match tokenizer::validate_token(&access_token, &language_id, &token_col).await {
        Ok(updated_token) => {
            // get account id from token
            let result = match tokenizer::get_payload_from_token(&updated_token) {
                Ok(data) => data,
                Err(_) => {
                    return Err(Status::unauthenticated(t!("token_expired")));
                }
            };
            Ok((result.0, result.1))
        }
        Err(_) => {
            Err(Status::unauthenticated(t!("token_expired")))
        }
    }
}

// get access token from request header
pub async fn verify_public_access_token(
    request: &MetadataMap,
    language_id: &str,
) -> Result<(), Status> {
    rust_i18n::set_locale(&language_id.to_string());
    // extract token from authorization header
    let access_token = match request.get("Authorization") {
        Some(token) => {
            // remove `Bearer ` from token
            let token = token.to_str().unwrap();
            let token = token.replace("Bearer ", "");
            token
        }
        None => {
            return Err(Status::unauthenticated(t!("access_token_not_found")));
        }
    };

    // validate token extracted and return it if it's valid or can be refreshed else return error
    match tokenizer::validate_public_token(&access_token, &language_id).await {
        Ok(_) => Ok(()),
        Err(_) => {
            Err(Status::unauthenticated(t!(
                "token_expired",
                locale = &language_id
            )))
        }
    }
}

// clear access token from db when user logout
pub async fn clear_access_token(
    metadata: &MetadataMap,
    token_col: &mongodb::Collection<Document>,
) -> Result<(), Status> {
    // get access token from request header
    match metadata
        .get("Authorization")
        .ok_or(Status::unauthenticated(t!("access_token_not_found")))
    {
        Ok(_) => {
            // remove `Bearer ` from token
            let access_token = metadata.get("Authorization").unwrap().to_str().unwrap();
            let access_token = access_token.replace("Bearer ", "");

            // delete session from db
            match token_col
                .delete_one(doc! { "access_token": access_token }, None)
                .await
            {
                Ok(_) => Ok(()),
                Err(_) => {
                    Err(Status::internal(t!("auth_failed")))
                }
            }
        }
        Err(e) => Err(e),
    }
}
