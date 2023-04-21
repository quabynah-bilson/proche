// Load I18n macro, for allow you use `t!` macro in anywhere.
#[macro_use]
extern crate rust_i18n;

use std::io::Write;

use env_logger::Builder;
use env_logger::fmt::Color;
use log::{Level, LevelFilter};

use crate::proto::sms_service_server::SmsServiceServer;
use crate::server::SmsServiceImpl;

// Init translations for current crate.
// You must keep this path is same as the path you set `load-path` in [package.metadata.i18n] in Cargo.toml.
i18n!("locales");

mod server;
mod config;

mod proto {
    tonic::include_proto!("sms");
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

    // create grpc service
    let sms_service = SmsServiceImpl::new();

    let service = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(proto::SMS_FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();

    // bind to address
    let host = "[::]";
    let port = 1500;
    let addr = format!("{}:{}", &host, &port).parse().unwrap();

    // build grpc server
    log::info!("starting rust sms server on {}", &addr);
    tonic::transport::Server::builder()
        .add_service(service)
        .add_service(SmsServiceServer::new(sms_service))
        .serve(addr)
        .await?;

    Ok(())
}
