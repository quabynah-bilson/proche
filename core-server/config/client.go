package config

import (
	pb "github.com/quabynah-bilson/core-server/gen"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"log"
	"os"
)

// CreateAuthClient => creates a new auth client
func CreateAuthClient() pb.AuthServiceClient {
	// create a connection to the server
	authClientUri := os.Getenv("AUTH_SERVICE_URL")
	conn, err := grpc.Dial(authClientUri, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("did not connect to auth server: %v", err)
	}

	// create a new client
	return pb.NewAuthServiceClient(conn)
}
