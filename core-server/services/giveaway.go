package services

import (
	"context"
	pb "github.com/quabynah-bilson/core-server/gen"
	"go.mongodb.org/mongo-driver/mongo"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

type ProcheGiveAwayServer struct {
	pb.UnimplementedGiveAwayServiceServer
	collection *mongo.Collection
}

func NewProcheGiveAwayServer(collection *mongo.Collection) *ProcheGiveAwayServer {
	return &ProcheGiveAwayServer{
		UnimplementedGiveAwayServiceServer: pb.UnimplementedGiveAwayServiceServer{},
		collection:                         collection,
	}
}

func (s *ProcheGiveAwayServer) CreateGiveaway(context.Context, *pb.CreateGiveAwayRequest) (*wrapperspb.StringValue, error) {
	panic("implement me")
}
func (s *ProcheGiveAwayServer) GetGiveaway(context.Context, *wrapperspb.StringValue) (*pb.GiveAway, error) {
	panic("implement me")
}

func (s *ProcheGiveAwayServer) GetGiveaways(*emptypb.Empty, pb.GiveAwayService_GetGiveawaysServer) error {
	panic("implement me")
}

func (s *ProcheGiveAwayServer) GetGiveawaysByOwner(*wrapperspb.StringValue, pb.GiveAwayService_GetGiveawaysByOwnerServer) error {
	panic("implement me")
}

func (s *ProcheGiveAwayServer) GetGiveawaysByCoordinates(*pb.GiveAwayCoordinates, pb.GiveAwayService_GetGiveawaysByCoordinatesServer) error {
	panic("implement me")
}

func (s *ProcheGiveAwayServer) GetGiveawaysByCoordinatesAndRadius(*pb.GiveAwayByCoordinatesAndRadiusRequest, pb.GiveAwayService_GetGiveawaysByCoordinatesAndRadiusServer) error {
	panic("implement me")
}

func (s *ProcheGiveAwayServer) UpdateGiveaway(context.Context, *pb.GiveAway) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheGiveAwayServer) DeleteGiveaway(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}
