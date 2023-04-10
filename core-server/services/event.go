package services

import (
	"context"
	pb "github.com/quabynah-bilson/core-server/gen"
	"go.mongodb.org/mongo-driver/mongo"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

type ProcheEventServer struct {
	pb.UnimplementedEventServiceServer
	collection *mongo.Collection
}

func NewProcheEventServerInstance(collection *mongo.Collection) *ProcheEventServer {
	return &ProcheEventServer{
		UnimplementedEventServiceServer: pb.UnimplementedEventServiceServer{},
		collection:                      collection,
	}
}

func (s *ProcheEventServer) CreateEvent(context.Context, *pb.CreateEventRequest) (*pb.ProcheEvent, error) {
	panic("implement me")
}

func (s *ProcheEventServer) GetEvent(*wrapperspb.StringValue, pb.EventService_GetEventServer) error {
	panic("implement me")
}

func (s *ProcheEventServer) GetEventByUser(*wrapperspb.StringValue, pb.EventService_GetEventByUserServer) error {
	panic("implement me")
}

func (s *ProcheEventServer) GetEventsByLocation(*pb.GetEventByLocationRequest, pb.EventService_GetEventsByLocationServer) error {
	panic("implement me")
}

func (s *ProcheEventServer) ListEvents(*emptypb.Empty, pb.EventService_ListEventsServer) error {
	panic("implement me")
}

func (s *ProcheEventServer) UpdateEvent(context.Context, *pb.ProcheEvent) (*pb.ProcheEvent, error) {
	panic("implement me")
}

func (s *ProcheEventServer) DeleteEvent(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}
