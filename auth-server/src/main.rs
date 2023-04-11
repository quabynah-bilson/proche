// Load I18n macro, for allow you use `t!` macro in anywhere.
#[macro_use]
extern crate rust_i18n;

use env_logger;
use env_logger::{Builder, fmt::Color};
use log::{LevelFilter, Level};
use std::io::Write;
use crate::proto::auth_service_server::AuthServiceServer;
use crate::server::AuthServiceImpl;

// Init translations for current crate.
// You must keep this path is same as the path you set `load-path` in [package.metadata.i18n] in Cargo.toml.
i18n!("locales");

mod server;
mod config;

mod proto {
    tonic::include_proto!("auth");

    pub(crate) const FILE_DESCRIPTOR_SET: &[u8] =
        tonic::include_file_descriptor_set!("auth_descriptor");
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
    log::info!("available locales -> {:?}", available_locales());

    // initialize mongo database
    let mongo_url = std::env::var("DATABASE_URI").expect("MONGO_URL must be set");
    let mongo_db = std::env::var("DATABASE_NAME").expect("DATABASE_NAME must be set");
    let session_collection_name = std::env::var("SESSION_COLLECTION").expect("SESSION_COLLECTION must be set");
    let account_collection_name = std::env::var("ACCOUNT_COLLECTION").expect("ACCOUNT_COLLECTION must be set");
    let mongo_client = mongodb::Client::with_uri_str(&mongo_url).await?;
    let mongo_db = mongo_client.database(&mongo_db);

    // create collections based on proto
    let account_collection = mongo_db.collection/*::<proto::Account>*/(&account_collection_name);
    let session_collection = mongo_db.collection/*::<proto::Session>*/(&session_collection_name);

    // create grpc services
    let auth_service = AuthServiceImpl::new(account_collection.clone(), session_collection.clone());

    // reflection service
    let service = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(proto::FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();

    // bind to address
    let addr = "0.0.0.0:1800".parse().unwrap();

    // build grpc server
    println!("starting rust auth server on {}", addr);
    tonic::transport::Server::builder()
        .add_service(service)
        .add_service(AuthServiceServer::new(auth_service))
        .serve(addr)
        .await?;

    Ok(())
}
