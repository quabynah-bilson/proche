package util

import (
	"context"
	"github.com/golang/protobuf/ptypes/empty"
	"github.com/nicksnyder/go-i18n/v2/i18n"
	"github.com/quabynah-bilson/core-server/config"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"time"
)

const (
	AccountIdKey = "x-account-id"
)

// AuthUnaryInterceptor => intercepts all incoming requests and checks if the user is authenticated and authorized to access the resource
func AuthUnaryInterceptor(parentCtx context.Context, req interface{}, _ *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	// create a new auth client
	client := config.CreateAuthClient()

	// get context from the stream and set a deadline of 15 seconds
	deadlineCtx, cancel := context.WithDeadline(parentCtx, time.Now().Add(time.Second*15))
	defer cancel()

	if md, ok := metadata.FromIncomingContext(parentCtx); ok {
		ctx := metadata.NewOutgoingContext(deadlineCtx, md)
		// validate the access token
		if token, err := client.ValidateAccessToken(ctx, &empty.Empty{}, grpc.WaitForReady(true)); err == nil {
			md.Set(AccountIdKey, token.GetAccountId())
			ctx = metadata.NewOutgoingContext(deadlineCtx, md)
			return handler(ctx, req)
		} else {
			return nil, convertErrToStatus(err)
		}
	}

	return nil, status.Errorf(codes.Internal, "no metadata found in context")
}

// AuthStreamInterceptor => intercepts all incoming requests and checks if the user is authenticated and authorized to access the resource
func AuthStreamInterceptor(srv interface{}, ss grpc.ServerStream, _ *grpc.StreamServerInfo, handler grpc.StreamHandler) error {
	// create a new auth client
	client := config.CreateAuthClient()

	// get context from the stream
	parentCtx := ss.Context()

	if md, ok := metadata.FromIncomingContext(parentCtx); ok {
		ctx := metadata.NewOutgoingContext(parentCtx, md)
		// validate the access token
		if token, err := client.ValidateAccessToken(ctx, &empty.Empty{}, grpc.WaitForReady(true)); err == nil {
			ss.SetTrailer(metadata.Pairs(AccountIdKey, token.GetAccountId()))
			return handler(srv, ss)
		} else {
			return convertErrToStatus(err)
		}
	}

	localizationUsingJson, _ := ProcheLocalizer.Localize(&i18n.LocalizeConfig{
		MessageID: "no_metadata_found",
	})
	return status.Errorf(codes.Internal, localizationUsingJson)
}

// convertErrToStatus => converts an error to a gRPC status
func convertErrToStatus(err error) error {
	// check if the error is a gRPC status
	if s, ok := status.FromError(err); ok {
		return status.Errorf(s.Code(), s.Message())
	}

	// return an internal server error
	return status.Errorf(codes.Internal, err.Error())
}
