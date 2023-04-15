// validate language id from request
pub fn validate_language_id(language_id: &str) -> Result<bool, Box<dyn std::error::Error>> {
    let result = match language_id {
        "en" => true,
        "fr" => true,
        _ => false,
    };
    if !&result {
        log::error!("{}: {:?}", t!("invalid_language_code"), &language_id);
        return Err(Box::try_from(t!("invalid_language_code")).unwrap());
    }
    Ok(result)
}
