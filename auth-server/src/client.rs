use std::error::Error;

use tonic::transport::Channel;

use crate::proto::media_service_client::MediaServiceClient;

// creates a media service grpc client
pub async fn get_media_client() -> Result<MediaServiceClient<Channel>, Box<dyn Error>> {
    let uri = std::env::var("MEDIA_SERVICE_URI").expect("MEDIA_SERVICE_URI must be set");
    let client = match MediaServiceClient::connect(uri).await {
        Ok(client) => client,
        Err(e) => {
            log::error!("Failed to connect to media service: {}", e);
            return Err(Box::new(e));
        }
    };
    Ok(client)
}