package config

import (
	"github.com/jackc/pgx"
	"os"
	"strconv"
)

// InitDatabase initializes the database connection pool
func InitDatabase() (*pgx.Conn, error) {
	port, _ := strconv.Atoi(os.Getenv("DB_PORT"))
	dbConfig := pgx.ConnConfig{
		Host:     os.Getenv("DB_HOST"),
		Port:     uint16(port),
		Database: os.Getenv("DB_NAME"),
		User:     os.Getenv("DB_USER"),
		Password: os.Getenv("DB_PASSWORD"),
	}
	return pgx.Connect(dbConfig)
}
