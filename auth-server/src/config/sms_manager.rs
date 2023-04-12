use std::collections::HashMap;
use std::error::Error;

use ring::rand;
use ring::rand::SecureRandom;

// send sms to user
pub async fn send_sms(phone_number: &str, language_id: &str) -> Result<(), Box<dyn Error>> {
    let response = reqwest::Client::new()
        .post("http://www.baidu.com")
        .form(&[("one", "1")])
        .send()
        .await
        .expect("send");
    println!("Response status {}", response.status());

    // make a post call to twilio to get sms sent using reqwest


    // Ok(())
    todo!()
}