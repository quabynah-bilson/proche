// initialize database connection
pub(crate) async fn init_database() -> Result<mongodb::Database, Box<dyn std::error::Error>> {
    // initialize mongo database
    let db_uri = std::env::var("DATABASE_URI").expect("DATABASE_URI must be set");
    let db_name = std::env::var("DATABASE_NAME").expect("DATABASE_NAME must be set");
    let mongo_client = mongodb::Client::with_uri_str(&db_uri).await?;
    let mongo_db = mongo_client.database(&db_name);
    Ok(mongo_db)
}