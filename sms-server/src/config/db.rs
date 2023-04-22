use sqlx::Postgres;

// connect to database
pub async fn init_db() -> Result<sqlx::Pool<Postgres>, Box<dyn std::error::Error>> {
    let db = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::pool::PoolOptions::new()
        .max_connections(15)
        .connect(&db)
        .await?;

    sqlx::query_file!("src/config/sql/create.table.sql").execute(&pool).await?;
    sqlx::query_file!("src/config/sql/get.user.sql").execute(&pool).await?;
    sqlx::query_file!("src/config/sql/confirm.user.sql").execute(&pool).await?;
    sqlx::query_file!("src/config/sql/delete.user.sql").execute(&pool).await?;
    sqlx::query_file!("src/config/sql/get.user.sql").execute(&pool).await?;
    sqlx::query_file!("src/config/sql/insert.user.sql").execute(&pool).await?;

    // Start a database transaction
    let mut transaction = pool.begin().await?;
    // Call the stored procedure using the `query` or `query_as` macro
    sqlx::query("CALL is_user_created_at_older_than_10_minutes($1)")
        .bind("0554635701")
        .execute(&mut transaction)
        .await?;

    // Commit the transaction
    transaction.commit().await?;

    Ok(pool)
}
