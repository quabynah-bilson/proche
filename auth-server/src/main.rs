extern crate bcrypt;
// Load I18n macro, for allow you use `t!` macro in anywhere.
#[macro_use]
extern crate rust_i18n;

use std::io::Write;

use env_logger;
use env_logger::{Builder, fmt::Color};
use log::{Level, LevelFilter};

use crate::proto::auth_service_server::AuthServiceServer;
use crate::server::AuthServiceImpl;

// Init translations for current crate.
// You must keep this path is same as the path you set `load-path` in [package.metadata.i18n] in Cargo.toml.
i18n!("locales");

mod client;
mod config;
mod server;
mod utils;

mod proto {
    tonic::include_proto!("auth");
    tonic::include_proto!("media");
    tonic::include_proto!("sms");

    pub(crate) const AUTH_FILE_DESCRIPTOR_SET: &[u8] =
        tonic::include_file_descriptor_set!("auth_descriptor");
    pub(crate) const MEDIA_FILE_DESCRIPTOR_SET: &[u8] =
        tonic::include_file_descriptor_set!("media_descriptor");
    pub(crate) const SMS_FILE_DESCRIPTOR_SET: &[u8] =
        tonic::include_file_descriptor_set!("sms_descriptor");
}

fn init_logger() {
    // Initialize logger
    let mut builder = Builder::new();
    builder.filter_level(LevelFilter::Info);
    builder.format(|buf, record| {
        let level = record.level();
        let mut style = buf.style();
        match level {
            Level::Error => style.set_color(Color::Red),
            Level::Warn => style.set_color(Color::Yellow),
            Level::Info => style.set_color(Color::Green),
            Level::Debug => style.set_color(Color::Blue),
            Level::Trace => style.set_color(Color::Cyan),
        };
        writeln!(buf, "[{}] {}", style.value(level), record.args())
    });
    builder.init();
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // enable logging
    init_logger();

    // initialize dotenv
    dotenv::dotenv().ok();

    // Use `available_locales` method to get all available locales.
    log::info!("available locales -> {:?}\n", available_locales());

    let mongo_db = match config::db::init_database().await {
        Ok(db) => db,
        Err(e) => {
            log::error!("failed to connect to database: {}", e);
            return Err(e.into());
        }
    };

    let token_collection_name =
        std::env::var("TOKEN_COLLECTION").expect("TOKEN_COLLECTION must be set");
    let account_collection_name =
        std::env::var("ACCOUNT_COLLECTION").expect("ACCOUNT_COLLECTION must be set");
    let country_collection_name =
        std::env::var("COUNTRY_COLLECTION").expect("ACCOUNT_COLLECTION must be set");

    // create collections based on proto
    let account_collection = mongo_db.collection/*::<proto::Account>*/(&account_collection_name);
    let token_collection =
        mongo_db.collection/*::<proto::AccessTokenStore>*/(&token_collection_name);
    let country_collection =
        mongo_db.collection/*::<proto::AccessTokenStore>*/(&country_collection_name);

    // create grpc services
    let auth_service = AuthServiceImpl::new(
        account_collection.clone(),
        token_collection.clone(),
        country_collection.clone(),
    );

    // reflection service
    let service = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(proto::AUTH_FILE_DESCRIPTOR_SET)
        .register_encoded_file_descriptor_set(proto::MEDIA_FILE_DESCRIPTOR_SET)
        .register_encoded_file_descriptor_set(proto::SMS_FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();

    // bind to address
    let host = "[::]";
    let port = 1800;
    let addr = format!("{}:{}", &host, &port).parse().unwrap();

    // build grpc server
    log::info!("starting rust auth server on {}", &addr);
    tonic::transport::Server::builder()
        .add_service(service)
        .add_service(AuthServiceServer::new(auth_service))
        .serve(addr)
        .await?;

    Ok(())
}
