use std::env;
use std::error::Error;

use openapi::apis::{configuration::Configuration, default_api as twilio_api};
use rand::Rng;

// send sms to user
pub async fn send_sms(phone_number: &str, language_id: &str) -> Result<(), Box<dyn Error>> {
    log::info!("Sending sms to: {}", phone_number);
    // get twilio credentials from env
    let account_sid = env::var("TWILIO_ACCOUNT_SID").expect("Error reading Twilio Account SID");
    let api_key_sid = env::var("TWILIO_API_KEY_SID").expect("Error reading Twilio API key");
    let api_key_secret = env::var("TWILIO_API_KEY_SECRET").expect("Error reading Twilio API SID");
    let from = env::var("TWILIO_PHONE_NUMBER").expect("Error reading Twilio Phone Number");
    // TODO: replace with user phone number in production
    let to = env::var("TO_NUMBER").expect("Error reading outbound phone number");

    // create a configuration for twilio
    let mut twilio_config = Configuration::default();
    twilio_config.basic_auth = Some((api_key_sid, Some(api_key_secret)));

    // generate 6 random numbers
    let mut rng = rand::thread_rng();
    let code = rng.gen_range(100000..999999);
    let body = format!("Your verification code is: {}", &code);

    // get the message body from the language id
    // let message = match twilio_api::create_message(&twilio_config, &account_sid, &to, None, None,
    //                                                None, Some(true), None, None, Some(true), None,
    //                                                None, None, None, None,
    //                                                None, None, None, None, None,
    //                                                Some(&from), None,
    //                                                Some(&body), None).await {
    //     Ok(message) => message,
    //     Err(e) => {
    //         println!("Error sending message: {}", e);
    //         return Err(Box::new(e));
    //     }
    // };

    // send the message
    // log::info!("Sending message: {:?}", message.sid.expect("Error getting message sid"));

    Ok(())
}