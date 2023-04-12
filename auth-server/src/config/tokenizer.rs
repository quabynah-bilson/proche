use std::error::Error;

use chrono::{Local, Utc};
use mongodb::bson::{doc, Document};
use paseto::v2::{decrypt_paseto, local_paseto};

// region token generator
// generate token using paseto local protocol.
pub fn generate_token(payload: &str, language_id: &str, ttl: i64) -> Result<String, Box<dyn Error>> {
    // calculate token expiration in milliseconds from current time + ttl using chrono
    let now = Local::now();
    let timestamp = (now + chrono::Duration::minutes(ttl)).with_timezone(&Utc);
    let token_ttl = timestamp.timestamp_millis();
    log::info!("token ttl: {:?}", token_ttl);

    // append ttl to payload
    let claims = serde_json::json!({
        "account_id": &payload,
        "language_id" : &language_id,
        "exp": &token_ttl
    });
    log::info!("claims: {:?}", claims);
    match serde_json::to_string(&claims) {
        Ok(json_str) => {
            // use key from env
            let auth_token = std::env::var("AUTH_TOKEN").expect("AUTH_TOKEN must be set");

            // create local token
            match local_paseto(&json_str, None, &mut &auth_token.into_bytes()) {
                Ok(data) => Ok(data),
                Err(_) => {
                    Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("invalid_token", locale=&language_id))))
                }
            }
        }
        Err(_) => Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("invalid_token", locale=&language_id))))
    }
}

// todo: async issue: does not compile
// validate access token. if token is expired, check for refresh token.
// if refresh token is expired, return error else generate new access token and return it
pub async fn validate_token(token: &str, language_id: &str, token_col: &mongodb::Collection<Document>) -> Result<String, Box<dyn Error>> {
    match _check_token_expiration(&token, &language_id).await {
        Ok(_) => Ok(token.to_string()),
        Err(_) => {
            // get refresh token from database
            let token_store = match token_col.find_one(doc! {"access_token": &token}, None).await {
                Ok(session) => {
                    match session {
                        Some(session) => session,
                        None => {
                            log::error!("{}: {:?}", t!("access_token_not_found", locale=&language_id), &token);
                            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("access_token_not_found", locale=&language_id))));
                        }
                    }
                }
                Err(e) => {
                    log::error!("{}: {:?}", t!("access_token_not_found", locale=&language_id), e);
                    return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("access_token_not_found", locale=&language_id))));
                }
            };

            // get refresh token from token store
            let refresh_token = match token_store.get("refresh_token") {
                Some(token) => token.as_str().unwrap().to_string(),
                None => {
                    log::error!("{}: {:?}", t!("refresh_token_not_found", locale=&language_id), &token);
                    return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("refresh_token_not_found", locale=&language_id))));
                }
            };

            // check for refresh token expiration
            match _check_token_expiration(&refresh_token, &language_id).await {
                Ok(_) => {
                    // generate new access token
                    let account_id = match token_store.get("account_id") {
                        Some(id) => id.as_str().unwrap().to_string(),
                        None => {
                            log::error!("{}: {:?}", t!("account_not_found", locale=&language_id), &token);
                            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("account_not_found", locale=&language_id))));
                        }
                    };
                    // get 15 minutes later timestamp for access token expiration
                    let access_token_expires_at = Utc::now().timestamp() + 900;
                    let new_access_token = match generate_token(&account_id, &language_id, access_token_expires_at) {
                        Ok(token) => token,
                        Err(e) => {
                            log::error!("{}: {:?}", t!("invalid_token", locale=&language_id), e);
                            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("invalid_token", locale=&language_id))));
                        }
                    };

                    // update token store with new access token
                    match token_col.update_one(doc! {"access_token": &token}, doc! {"$set": {"access_token": &new_access_token}}, None).await {
                        Ok(_) => Ok(new_access_token),
                        Err(e) => {
                            log::error!("{}: {:?}", t!("invalid_token", locale=&language_id), e);
                            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("invalid_token", locale=&language_id))));
                        }
                    }
                }
                Err(e) => {
                    log::error!("{}: {:?}", t!("token_expired", locale=&language_id), e);
                    return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("access_denied", locale=&language_id))));
                }
            }
        }
    }
}

// endregion

// region password hashing
// hash password using bcrypt
pub fn hash_password(password: &str) -> Result<String, Box<dyn std::error::Error>> {
    let hashed_password = bcrypt::hash(password, bcrypt::DEFAULT_COST)?;
    Ok(hashed_password)
}

// compare password using bcrypt
pub fn compare_password(password: &str, hashed_password: &str) -> Result<bool, Box<dyn std::error::Error>> {
    let is_valid = bcrypt::verify(password, hashed_password)?;
    Ok(is_valid)
}

// endregion

// region helper functions
// helper method to validate token expiration.
// if token is expired, return error else return Ok(())
async fn _check_token_expiration(token: &str, language_id: &str) -> Result<(), Box<dyn Error>> {
    // use key from env
    let auth_token = std::env::var("AUTH_TOKEN").expect("AUTH_TOKEN must be set");

    // decrypt token
    let payload = match decrypt_paseto(&token, None, &mut &auth_token.into_bytes()) {
        Ok(payload) => payload,
        Err(_) => {
            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("invalid_token", locale=&language_id))));
        }
    };

    // check for token expiration
    let json: serde_json::Value = serde_json::from_str(&payload).unwrap();
    match json["exp"].as_i64() {
        // token is valid (has expiration time)
        Some(exp) => {
            let now = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_millis();
            if now > exp as u128 {
                // token is expired
                return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("token_expired", locale=&language_id))));
            }
            Ok(())
        }

        // token is invalid (no expiration time)
        None => {
            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("invalid_token", locale=&language_id))));
        }
    }
}

// helper method to get payload from token (account_id and language_id)
pub(crate) fn get_payload_from_token(token: &str) -> Result<(String, String), Box<dyn Error>> {
    // use key from env
    let auth_token = std::env::var("AUTH_TOKEN").expect("AUTH_TOKEN must be set");

    // decrypt token
    let payload = match decrypt_paseto(&token, None, &mut &auth_token.into_bytes()) {
        Ok(payload) => payload,
        Err(_) => {
            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("invalid_token"))));
        }
    };

    // check for token expiration
    let json: serde_json::Value = serde_json::from_str(&payload).unwrap();
    let account_id = match json["account_id"].as_str() {
        Some(id) => id.to_string(),
        None => {
            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("account_not_found"))));
        }
    };

    // get language_id from token
    let language_id = match json["language_id"].as_str() {
        Some(id) => id.to_string(),
        None => {
            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, t!("auth_failed"))));
        }
    };
    Ok((account_id, language_id))
}

// endregion