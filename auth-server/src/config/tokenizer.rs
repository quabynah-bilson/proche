use std::fmt::format;
use std::io::stderr;

use log::log;
use paseto::v2::{decrypt_paseto, local_paseto};

// generate token using paseto local protocol.
// token is 32 bytes long
pub fn generate_token(payload: &str, language_id: &str, ttl: i32) -> Result<String, Box<dyn std::error::Error>> {
    // use key from env
    let auth_token = std::env::var("AUTH_TOKEN").expect("AUTH_TOKEN must be set");

    // create local token
    let time_in_hours = ttl * 60 * 60; // 1 hour = 60 * 60 seconds
    let duration = std::time::Duration::from_secs(time_in_hours as u64);
    log::info!("token ttl: {:?}", duration);

    // append ttl to payload
    let mut claims = format!("{{\"phone_number\" : \"{}\", \"exp\" : {}}}", payload, &duration.as_millis());
    log::debug!("claims: {:?}", claims);
    let json_str = serde_json::to_string(&claims).unwrap();
    let token = local_paseto(&json_str, None, &mut &auth_token.into_bytes()).expect(&*t!("auth_failed", locale=&language_id));
    Ok(token)
}

// validate token using paseto local protocol.
// token is 32 bytes long
pub fn validate_token(token: &str, language_id: &str) -> Result<String, Box<dyn std::error::Error>> {
    // use key from env
    let auth_token = std::env::var("AUTH_TOKEN").expect("AUTH_TOKEN must be set");

    let payload = decrypt_paseto(token, None, &mut &auth_token.into_bytes()).expect(&*t!("auth_failed", locale=&language_id));
    Ok(payload)
}

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