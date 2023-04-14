use std::{collections::HashMap, env};
use std::error::Error;

use reqwest::{Client, header, StatusCode};

// reference -> https://dev.to/hackmamba/how-to-build-a-one-time-passwordotp-verification-api-with-rust-and-twilio-22il

pub(crate) struct TwilioVerifyService {}

impl TwilioVerifyService {
    // send sms to user
    pub async fn send_sms(phone_number: &str, language_id: &str) -> Result<(), Box<dyn Error>> {
        log::info!("Sending sms to: {}", phone_number);
        let account_sid = env::var("TWILIO_ACCOUNT_SID").expect("Error reading Twilio Account SID");
        let auth_token = env::var("TWILIO_AUTHTOKEN").expect("Error reading Twilio Auth Token");
        let service_id = env::var("TWILIO_SERVICES_ID").expect("Error reading Twilio Services ID");
        // TODO: replace with user phone number in production
        let to = env::var("TO_NUMBER").expect("Error reading outbound phone number");

        // create url
        let url = format!(
            "https://verify.twilio.com/v2/Services/{serv_id}/Verifications",
            serv_id = service_id
        );

        // create headers
        let mut headers = header::HeaderMap::new();
        headers.insert(
            "Content-Type",
            "application/x-www-form-urlencoded".parse().unwrap(),
        );

        // create form body
        let mut form_body: HashMap<&str, String> = HashMap::new();
        form_body.insert("To", to.to_string());
        form_body.insert("Channel", "sms".to_string());

        let client = Client::new();
        let res = client
            .post(url)
            .basic_auth(account_sid, Some(auth_token))
            .headers(headers)
            .form(&form_body)
            .send()
            .await;

        match res {
            Ok(response) => {
                let created =  response.status() == StatusCode::from_u16(201).unwrap();
                if created {
                    log::info!("{}", t!("sms_send_success", locale=&language_id));
                    Ok(())
                } else {
                    Err(Box::try_from(t!("sms_send_failed", locale=&language_id)).unwrap())
                }
            }
            Err(_) => Err(Box::try_from(t!("sms_send_failed", locale=&language_id)).unwrap()),
        }
    }

    // verify sms code
    pub async fn verify_sms(phone_number: &str, code: &String, language_id: &str) -> Result<(), Box<dyn Error>> {
        log::info!("Verifying sms from phone number: {} -> {}", phone_number, code);
        let account_sid = env::var("TWILIO_ACCOUNT_SID").expect("Error reading Twilio Account SID");
        let auth_token = env::var("TWILIO_AUTHTOKEN").expect("Error reading Twilio Auth Token");
        let service_id = env::var("TWILIO_SERVICES_ID").expect("Error reading Twilio Services ID");
        // TODO: replace with user phone number in production
        let to = env::var("TO_NUMBER").expect("Error reading outbound phone number");

        // create url
        let url = format!(
            "https://verify.twilio.com/v2/Services/{serv_id}/VerificationCheck",
            serv_id = service_id,
        );

        // create headers
        let mut headers = header::HeaderMap::new();
        headers.insert(
            "Content-Type",
            "application/x-www-form-urlencoded".parse().unwrap(),
        );

        // create form body
        let mut form_body: HashMap<&str, &String> = HashMap::new();
        form_body.insert("To", &to);
        form_body.insert("Code", &code);

        let client = Client::new();
        let res = client
            .post(url)
            .basic_auth(account_sid, Some(auth_token))
            .headers(headers)
            .form(&form_body)
            .send()
            .await;

        match res {
            Ok(response) => {
                let created =  response.status() == StatusCode::from_u16(200).unwrap();
                if created {
                    log::info!("{}", t!("sms_verification_success", locale=&language_id));
                    Ok(())
                } else {
                    Err(Box::try_from(t!("sms_verification_failed", locale=&language_id)).unwrap())
                }
            }
            Err(_) => Err(Box::try_from(t!("sms_verification_failed", locale=&language_id)).unwrap()),
        }
    }
}