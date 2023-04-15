use std::env;
use std::path::PathBuf;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let original_out_dir = PathBuf::from(env::var("OUT_DIR")?);

    // generate proto files for server only using tonic-build
    tonic_build::configure()
        .build_server(true)
        .build_client(false)
        // .type_attribute("Account", "#[derive(serde::Deserialize, serde::Serialize)]")
        // .type_attribute("Session", "#[derive(serde::Deserialize, serde::Serialize)]")
        .file_descriptor_set_path(original_out_dir.join("auth_descriptor.bin"))
        .compile(&["proto/auth.proto"], &["proto"])?;
    Ok(())
}