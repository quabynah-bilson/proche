package services

import (
	"context"
	pb "github.com/quabynah-bilson/core-server/gen"
	"go.mongodb.org/mongo-driver/mongo"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

type ProcheTripServer struct {
	pb.UnimplementedTripServiceServer
	tripCol      *mongo.Collection
	tripEventCol *mongo.Collection
}

func NewProcheTripServerInstance(tripCol *mongo.Collection, tripEventCol *mongo.Collection) *ProcheTripServer {
	return &ProcheTripServer{
		UnimplementedTripServiceServer: pb.UnimplementedTripServiceServer{},
		tripCol:                        tripCol,
		tripEventCol:                   tripEventCol,
	}
}

func (s *ProcheTripServer) BookTrip(ctx context.Context, request *pb.BookTripRequest) (*wrapperspb.StringValue, error) {
	panic("implement me")
}

func (s *ProcheTripServer) GetTrip(ctx context.Context, request *wrapperspb.StringValue) (*pb.Trip, error) {
	panic("implement me")
}

func (s *ProcheTripServer) GetTrips(request *wrapperspb.StringValue, stream pb.TripService_GetTripsServer) error {
	panic("implement me")
}

func (s *ProcheTripServer) DeleteTrip(ctx context.Context, request *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheTripServer) CancelTripEvent(ctx context.Context, request *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheTripServer) StartTripEvent(ctx context.Context, request *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheTripServer) CompleteTripEvent(ctx context.Context, request *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheTripServer) GetTripEvents(request *wrapperspb.StringValue, stream pb.TripService_GetTripEventsServer) error {
	panic("implement me")
}

func (s *ProcheTripServer) GetTripEvent(*wrapperspb.StringValue, pb.TripService_GetTripEventServer) error {
	panic("implement me")
}
