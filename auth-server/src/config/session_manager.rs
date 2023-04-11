use mongodb::bson::{doc, Document};
use tonic::{Response, Status};

use crate::config::tokenizer;
use crate::proto::{AuthResponse, Session};

// create session for account and return it
pub async fn create_session_for_account(account_doc: &Document, session_col: &mongodb::Collection<Document>) -> Result<Document, Status> {
    let mut request = account_doc.clone();
    log::info!("creating a new session for account -> {}", &request.get("phone_number").unwrap());

    // generate access token from phone number
    let mut phone_number = request.get_str("phone_number").unwrap().to_string();
    let mut language_id = request.get_str("language_id").unwrap().to_string();
    let access_token = tokenizer::generate_token(&phone_number, &language_id, 1).unwrap();
    let refresh_token = tokenizer::generate_token(&phone_number, &language_id, 3).unwrap();

    // create session document
    let mut doc = doc! {
        "account_id": &request.get_str("id").unwrap(),
        "access_token": access_token,
        "refresh_token": refresh_token,
        "language_id": &language_id,
        // "created_at": &session.created_at.unwrap(),
        // "access_token_expires_at": &session.access_token_expires_at,
        // "refresh_token_expires_at": &session.refresh_token_expires_at,
    };

    // insert session to db
    match session_col.insert_one(&doc, None).await {
        Ok(insert_result) => {
            log::info!("{}: {:?}", t!("session_created"), &doc);
            doc.insert("id", &insert_result.inserted_id.to_string());
            session_col.replace_one(doc! {"account_id": &account_doc.get_str("account_id").unwrap().to_string()}, &doc, None).await.unwrap();
            Ok(doc)
        }
        Err(e) => {
            log::error!("{}: {:?}", t!("auth_failed"), e);
            Err(Status::internal(t!("auth_failed")))
        }
    }
}

// verify session by account id and access token
pub async fn verify_session(access_token: &str, language_id: &str) -> Result<(), Box<dyn std::error::Error>> {
    let result = match tokenizer::validate_token(&access_token, &language_id) {
        Ok(data) => true,
        Err(e) => {
            log::error!("{}: {:?}", t!("session_expired"), e);
            false
        }
    };
    if !result {
        return Err(Box::try_from(t!("session_expired")).unwrap());
    }
    log::info!("{}: {:?}", t!("session_verified"), &result);
    Ok(())
}

