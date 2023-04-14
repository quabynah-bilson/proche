package util

import (
	"context"
	"github.com/golang/protobuf/ptypes/empty"
	pb "github.com/quabynah-bilson/core-server/gen"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"log"
	"os"
	"time"
)

const (
	authKey      = "x-authenticated"
	accountIdKey = "x-account-id"
)

// createAuthClient => creates a new auth client
func createAuthClient() pb.AuthServiceClient {
	// create a connection to the server
	authClientUri := os.Getenv("AUTH_SERVICE_URL")
	conn, err := grpc.Dial(authClientUri, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("did not connect to auth server: %v", err)
	}

	// create a new client
	return pb.NewAuthServiceClient(conn)
}

// AuthUnaryInterceptor => intercepts all incoming requests and checks if the user is authenticated and authorized to access the resource
func AuthUnaryInterceptor(parentCtx context.Context, req interface{}, _ *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	// create a new auth client
	client := createAuthClient()

	// get context from the stream
	deadlineCtx, cancel := context.WithDeadline(parentCtx, time.Now().Add(time.Second*15))
	defer cancel()

	if md, ok := metadata.FromIncomingContext(parentCtx); ok {
		ctx := metadata.NewOutgoingContext(deadlineCtx, md)
		// validate the access token
		if token, err := client.ValidateAccessToken(ctx, &empty.Empty{}, grpc.WaitForReady(true)); err == nil {
			md.Set(accountIdKey, token.GetAccountId())
			ctx = metadata.NewOutgoingContext(deadlineCtx, md)
			return handler(ctx, req)
		}
	}

	return handler(parentCtx, req)
}

// AuthStreamInterceptor => intercepts all incoming requests and checks if the user is authenticated and authorized to access the resource
func AuthStreamInterceptor(srv interface{}, ss grpc.ServerStream, _ *grpc.StreamServerInfo, handler grpc.StreamHandler) error {
	// create a new auth client
	client := createAuthClient()

	// get context from the stream
	parentCtx := ss.Context()
	deadlineCtx, cancel := context.WithDeadline(parentCtx, time.Now().Add(time.Second*15))
	defer cancel()

	if md, ok := metadata.FromIncomingContext(parentCtx); ok {
		ctx := metadata.NewOutgoingContext(deadlineCtx, md)
		// validate the access token
		if token, err := client.ValidateAccessToken(ctx, &empty.Empty{}, grpc.WaitForReady(true)); err == nil {
			ss.SetTrailer(metadata.Pairs(accountIdKey, token.GetAccountId()))
			return handler(srv, ss)
		}
	}

	return status.Errorf(codes.Unauthenticated, "no metadata found in context")
}
