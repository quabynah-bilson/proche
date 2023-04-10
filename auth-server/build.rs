use std::env;
use std::path::PathBuf;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let original_out_dir = PathBuf::from(env::var("OUT_DIR")?);

    // generate proto files for server only using tonic-build
    tonic_build::configure()
        .build_server(true)
        .build_client(false)
        .file_descriptor_set_path(original_out_dir.join("auth_descriptor.bin"))
        .compile(&["proto/auth.proto"], &["proto"])?;
    Ok(())
}