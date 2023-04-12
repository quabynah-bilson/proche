use std::error::Error;
use std::net::TcpListener;

// Get the IP address of the connected client.
pub async fn get_client_ip(host: &str, port: &i32, callback: fn()) -> Result<(), Box<dyn Error>> {
    let listener = TcpListener::bind(format!("{}:{}", host, port)).unwrap();
    // Listen for incoming connections.
    for stream in listener.incoming() {
        match stream {
            Ok(stream) => {
                // invoke callback
                callback();

                // Get the IP address of the connected client.
                let ip = stream.peer_addr().unwrap().ip();
                println!("Client connected from {}", ip);

                // todo -> send email notification to client or use data for analytics
            }
            Err(e) => {
                println!("Error: {}", e);
            }
        }
    }
    Ok(())
}