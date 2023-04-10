use env_logger;

use crate::proto::auth_service_server::AuthServiceServer;
use crate::server::AuthServiceImpl;

mod server;

mod proto {
    tonic::include_proto!("auth");

    pub(crate) const FILE_DESCRIPTOR_SET: &[u8] =
        tonic::include_file_descriptor_set!("auth_descriptor");
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // enable logging
    env_logger::init();

    // initialize dotenv
    dotenv::dotenv().ok();

    // initialize mongo database
    let mongo_url = std::env::var("DATABASE_URI").expect("MONGO_URL must be set");
    let mongo_db = std::env::var("DATABASE_NAME").expect("DATABASE_NAME must be set");
    let session_collection_name = std::env::var("SESSION_COLLECTION").expect("SESSION_COLLECTION must be set");
    let account_collection_name = std::env::var("ACCOUNT_COLLECTION").expect("ACCOUNT_COLLECTION must be set");
    let mongo_client = mongodb::Client::with_uri_str(&mongo_url).await?;
    let mongo_db = mongo_client.database(&mongo_db);

    // create collections based on proto
    let account_collection = mongo_db.collection::<proto::Account>(&account_collection_name);
    let session_collection = mongo_db.collection::<proto::Session>(&session_collection_name);

    // create grpc services
    let auth_service = AuthServiceImpl::new(account_collection.clone(), session_collection.clone());

    // reflection service
    let service = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(proto::FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();

    // bind to address
    let addr = "[::1]:1800".parse().unwrap();

    // build grpc server
    println!("starting rust auth server on {}", addr);
    tonic::transport::Server::builder()
        .add_service(service)
        .add_service(AuthServiceServer::new(auth_service))
        .serve(addr)
        .await?;

    Ok(())
}
