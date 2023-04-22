use std::collections::HashMap;
use std::env;

use reqwest::{Client, header, StatusCode};
use sqlx::Postgres;
use tonic::{Request, Response, Status};
use tonic::metadata::MetadataMap;

use crate::config::locale;
use crate::proto::sms_service_server::SmsService;
use crate::proto::VerifyPhoneRequest;

rust_i18n::i18n!("locales");

pub struct SmsServiceImpl {
    db: sqlx::Pool<Postgres>,
}

impl SmsServiceImpl {
    pub fn new(db: sqlx::Pool<Postgres>) -> Self {
        Self {
            db,
        }
    }
}

#[tonic::async_trait]
impl SmsService for SmsServiceImpl {
    async fn send_phone_verification_code(&self, request: Request<String>) -> Result<Response<()>, Status> {
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        let phone_number = request.into_inner();
        log::info!("Sending sms to: {}", phone_number);

        // todo-> check database for existing phone number

        // let existing_phone_number = sqlx::query!(
        //     "SELECT phone_number FROM users WHERE phone_number = $1",
        //     &phone_number
        // );
        // match existing_phone_number.fetch_one(&self.db).await {
        //     Ok(_) => {
        //         log::info!("Phone number already exists");
        //         return Err(Status::already_exists(t!("phone_number_exists", locale = &language_id)));
        //     }
        //     Err(e) => {
        //         if e.to_string() != "RowNotFound" {
        //             log::error!("Error checking for existing phone number: {}", e);
        //             return Err(Status::internal(t!("phone_number_exists", locale = &language_id)));
        //         }
        //     }
        // }

        let account_sid = env::var("TWILIO_ACCOUNT_SID").expect("Error reading Twilio Account SID");
        let auth_token = env::var("TWILIO_AUTH_TOKEN").expect("Error reading Twilio Auth Token");
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
                let created = response.status() == StatusCode::from_u16(201).unwrap();
                if created {
                    log::info!("{}", t!("sms_send_success", locale = &language_id));
                    Ok(Response::new(()))
                } else {
                    Err(Status::internal(t!("sms_send_failed", locale = &language_id)))
                }
            }
            Err(_) => Err(Status::internal(t!("sms_send_failed", locale = &language_id))),
        }
    }

    async fn verify_phone_verification_code(&self, request: Request<VerifyPhoneRequest>) -> Result<Response<()>, Status> {
        let language_id = match _validate_language_id_from_request(request.metadata()) {
            Ok(language_id) => language_id,
            Err(e) => {
                return Err(e);
            }
        };

        let req = request.into_inner();
        let phone_number = req.phone_number;
        let code = req.verification_code;

        log::info!(
            "Verifying sms from phone number: {} -> {}",
            &phone_number,
            &code
        );
        let account_sid = env::var("TWILIO_ACCOUNT_SID").expect("Error reading Twilio Account SID");
        let auth_token = env::var("TWILIO_AUTH_TOKEN").expect("Error reading Twilio Auth Token");
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
                let created = response.status() == StatusCode::from_u16(200).unwrap();
                if created {
                    log::info!("{}", t!("sms_verification_success", locale = &language_id));
                    // todo -> delete phone number from database
                    Ok(Response::new(()))
                } else {
                    Err(Status::internal(t!("sms_verification_failed", locale = &language_id)))
                }
            }
            Err(_) => {
                Err(Status::internal(t!("sms_verification_failed", locale = &language_id)))
            }
        }
    }
}

// validate language id
fn _validate_language_id_from_request(md: &MetadataMap) -> Result<String, Status> {
    let language_id = match md.get("x-language-id") {
        Some(result) => result.to_str().unwrap().to_string(),
        None => {
            return Err(Status::invalid_argument(t!("invalid_language_code")));
        }
    };
    // validate language id from request
    match locale::validate_language_id(&language_id) {
        Ok(_) => {
            rust_i18n::set_locale(&language_id);
            Ok(language_id)
        }
        Err(_) => {
            return Err(Status::invalid_argument(t!("invalid_language_code")));
        }
    }
}