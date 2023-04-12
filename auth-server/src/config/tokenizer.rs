use std::error::Error;
use std::io::ErrorKind;

use chrono::{TimeZone, Utc};
use mongodb::bson::{doc, Document};
use paseto::v2::{decrypt_paseto};
use serde_json::json;

// region token generator
// generate token using paseto local protocol.
pub fn generate_token(payload: &str, language_id: &str, ttl: i64) -> Result<String, Box<dyn Error>> {
    // calculate token expiration in milliseconds from current time + ttl using chrono
    let token_ttl = _calculate_token_expiration(ttl);

    // create local token
    let auth_token = std::env::var("AUTH_TOKEN").expect("AUTH_TOKEN must be set");
    match paseto::tokens::PasetoBuilder::new()
        .set_encryption_key(&*auth_token.to_owned().into_bytes())
        .set_issued_at(Some(Utc::now()))
        .set_expiration(&Utc.timestamp_opt(token_ttl, 0).single().unwrap())
        .set_issuer("proche-qcodelabsllc")
        .set_audience("authenticated-users")
        .set_jti("proche-qcodelabsllc")
        .set_not_before(&Utc::now())
        .set_subject("user-authorization")
        .set_claim("proche-owner", json!({
        "account_id": &payload,
        "language_id" : &language_id
    }))
        .set_footer(format!("key-id:{}", &auth_token.clone()).as_str())
        .build() {
        Ok(token) => {
            log::info!("token: {:?}", token);
            Ok(token)
        }
        Err(e) => {
            log::error!("{}: {:?}", t!("unable_to_create_token"), e);
            Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("unable_to_create_token"))))
        }
    }
}

// generates a public access token to access services which do not require authentication.
pub fn generate_public_token(language_id: &str) -> Result<String, Box<dyn Error>> {
    // calculate token expiration in milliseconds from current time + 15 minutes ttl using chrono
    let ttl = 900;
    let token_ttl = _calculate_token_expiration(ttl);

    // create public token
    let auth_token = std::env::var("PUB_AUTH_TOKEN").expect("PUB_AUTH_TOKEN must be set");
    match paseto::tokens::PasetoBuilder::new()
        .set_encryption_key(&*auth_token.to_owned().into_bytes())
        .set_issued_at(Some(Utc::now()))
        .set_expiration(&Utc.timestamp_opt(token_ttl, 0).single().unwrap())
        .set_issuer("proche-qcodelabsllc")
        .set_audience("new-users")
        .set_jti("proche-qcodelabsllc")
        .set_not_before(&Utc::now())
        .set_subject("user-onboarding-access-only")
        .set_claim("go-to", json!("https://github.com/quabynah-bilson/proche/tree/dev/mobile"))
        .set_footer(format!("key-id:{}", &auth_token.clone()).as_str())
        .build() {
        Ok(token) => {
            log::info!("token: {:?}", token);
            Ok(token)
        }
        Err(e) => {
            log::error!("error: {:?}", e);
            Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("invalid_token", locale=&language_id))))
        }
    }
}

// validate public access token
pub async fn validate_public_token(token: &str, language_id: &str) -> Result<(), Box<dyn Error>> {
    // check if token is expired and return error if it is
    match _check_public_token_expiration(&token, &language_id).await {
        Ok(_) => Ok(()),
        Err(e) => Err(e),
    }
}

// validate access token. if token is expired, check for refresh token.
// if refresh token is expired, return error else generate new access token and return it
pub async fn validate_token(token: &str, language_id: &str, token_col: &mongodb::Collection<Document>) -> Result<String, Box<dyn Error>> {
    // check if token is expired and return error if it is
    let has_expired = match _check_token_expiration(&token, &language_id).await {
        Ok(_) => false,
        Err(_) => true,
    };

    // token is expired, check for refresh token
    if has_expired {
        // get refresh token from database
        let token_store = match token_col.find_one(doc! {"access_token": &token}, None).await {
            Ok(session) => {
                match session {
                    Some(session) => session,
                    None => {
                        log::error!("{}: {:?}", t!("access_token_not_found", locale=&language_id), &token);
                        return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("access_token_not_found", locale=&language_id))));
                    }
                }
            }
            Err(e) => {
                log::error!("{}: {:?}", t!("access_token_not_found", locale=&language_id), e);
                return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("access_token_not_found", locale=&language_id))));
            }
        };

        // get refresh token from token store
        let refresh_token = match token_store.get("refresh_token") {
            Some(token) => token.as_str().unwrap().to_string(),
            None => {
                log::error!("{}: {:?}", t!("refresh_token_not_found", locale=&language_id), &token);
                return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("refresh_token_not_found", locale=&language_id))));
            }
        };

        // check for refresh token expiration
        match _check_token_expiration(&refresh_token, &language_id).await {
            Ok(_) => (),
            Err(e) => {
                log::error!("{}: {:?}", t!("token_expired", locale=&language_id), e);
                return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("access_denied", locale=&language_id))));
            }
        };

        // generate new access token
        log::info!("{}: {:?}", t!("generating_new_access_token", locale=&language_id), &token);
        let account_id = match token_store.get("account_id") {
            Some(id) => id.as_str().unwrap().to_string(),
            None => {
                log::error!("{}: {:?}", t!("account_not_found", locale=&language_id), &token);
                return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("account_not_found", locale=&language_id))));
            }
        };
        // get 15 minutes later timestamp for access token expiration
        let access_token_expires_at = Utc::now().timestamp() + 900;
        let new_access_token = match generate_token(&account_id, &language_id, access_token_expires_at) {
            Ok(token) => token,
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token", locale=&language_id), e);
                return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("invalid_token", locale=&language_id))));
            }
        };

        // update token store with new access token
        return match token_col.update_one(doc! {"access_token": &token}, doc! {"$set": {"access_token": &new_access_token}}, None).await {
            Ok(_) => {
                Ok(new_access_token)
            }
            Err(e) => {
                log::error!("{}: {:?}", t!("invalid_token", locale=&language_id), e);
                Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("invalid_token", locale=&language_id))))
            }
        };
    }

    // return existing access token if it is not expired
    Ok(token.to_string())
}

// endregion

// region password hashing
// hash password using bcrypt
pub fn hash_password(password: &str) -> Result<String, Box<dyn Error>> {
    let hashed_password = bcrypt::hash(password, bcrypt::DEFAULT_COST)?;
    Ok(hashed_password)
}

// compare password using bcrypt
pub fn compare_password(password: &str, hashed_password: &str) -> Result<bool, Box<dyn Error>> {
    let is_valid = bcrypt::verify(password, hashed_password)?;
    Ok(is_valid)
}

// endregion

// region helper functions

// helper method to validate public token expiration.
async fn _check_public_token_expiration(token: &str, language_id: &str) -> Result<(), Box<dyn Error>> {
    // decrypt token
    let auth_token = std::env::var("PUB_AUTH_TOKEN").expect("PUB_AUTH_TOKEN must be set");
    let verified_token = match paseto::tokens::validate_local_token(
        &token,
        Some(format!("key-id:{}", &auth_token).as_str()),
        &auth_token.into_bytes(),
        &paseto::tokens::TimeBackend::Chrono,
    ) {
        Ok(payload) => payload,
        Err(_) => {
            return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("invalid_token", locale=&language_id))));
        }
    };
    log::debug!("{}: {:?}", t!("access_token_verified", locale=&language_id), &verified_token);

    Ok(())
}

// helper method to validate token expiration.
// if token is expired, return error else return Ok(())
async fn _check_token_expiration(token: &str, language_id: &str) -> Result<(), Box<dyn Error>> {
    // use key from env
    let auth_token = std::env::var("AUTH_TOKEN").expect("AUTH_TOKEN must be set");

    match paseto::tokens::validate_local_token(
        &token,
        Some(format!("key-id:{}", &auth_token).as_str()),
        &auth_token.into_bytes(),
        &paseto::tokens::TimeBackend::Chrono,
    ) {
        Ok(_) => {
            Ok(())
        }
        Err(_) => Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("invalid_token", locale=&language_id)))),
    }
}

// calculate token expiration time
fn _calculate_token_expiration(ttl_ms: i64) -> i64 {
    let current_time = Utc::now().timestamp_millis();
    let expiration_time = current_time + ttl_ms;
    expiration_time
}

// helper method to get payload from token (account_id and language_id)
pub(crate) fn get_payload_from_token(token: &str) -> Result<(String, String), Box<dyn Error>> {
    // use key from env
    let auth_token = std::env::var("AUTH_TOKEN").expect("AUTH_TOKEN must be set");

    // decrypt token
    let payload = match decrypt_paseto(&token, Some(format!("key-id:{}", &auth_token).as_str()), &mut &auth_token.into_bytes()) {
        Ok(payload) => payload,
        Err(_) => {
            return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("invalid_token"))));
        }
    };

    // check for token expiration
    let json: serde_json::Value = serde_json::from_str(&payload).unwrap();
    let account_id = match json["proche-owner"]["account_id"].as_str() {
        Some(id) => id.to_string(),
        None => {
            return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("account_not_found"))));
        }
    };

    // get language_id from token
    let language_id = match json["proche-owner"]["language_id"].as_str() {
        Some(id) => id.to_string(),
        None => {
            return Err(Box::new(std::io::Error::new(ErrorKind::Other, t!("auth_failed"))));
        }
    };
    Ok((account_id, language_id))
}

// endregion