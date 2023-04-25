package services

import (
	"context"
	pb "github.com/quabynah-bilson/core-server/gen"
	"github.com/quabynah-bilson/core-server/util"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
	"log"
	"sync"
)

type ProcheSharedServer struct {
	pb.UnimplementedCoreSharedServiceServer
	tripCol       *mongo.Collection
	eventCol      *mongo.Collection
	taskCol       *mongo.Collection
	giveAwayCol   *mongo.Collection
	candidatesCol *mongo.Collection
}

func NewProcheSharedServerInstance(
	tripCol *mongo.Collection,
	eventCol *mongo.Collection,
	taskCol *mongo.Collection,
	giveAwayCol *mongo.Collection,
	candidatesCol *mongo.Collection,
) *ProcheSharedServer {
	return &ProcheSharedServer{
		UnimplementedCoreSharedServiceServer: pb.UnimplementedCoreSharedServiceServer{},
		tripCol:                              tripCol,
		taskCol:                              taskCol,
		giveAwayCol:                          giveAwayCol,
		eventCol:                             eventCol,
		candidatesCol:                        candidatesCol,
	}
}

func (s *ProcheSharedServer) GetPostsForCurrentUser(ctx context.Context, _ *emptypb.Empty) (*pb.GetPostsForUserResponse, error) {
	var meta metadata.MD
	if md, ok := metadata.FromIncomingContext(ctx); ok {
		meta = md
	}

	ids := meta.Get(util.AccountIdKey)
	if len(ids) == 0 {
		return nil, status.Errorf(codes.Unauthenticated, "Sign in to view this content")
	}

	userId := ids[0]
	return s.GetPostsForUser(ctx, &wrapperspb.StringValue{
		Value: userId,
	})
}

func (s *ProcheSharedServer) GetPostsForUser(ctx context.Context, req *wrapperspb.StringValue) (*pb.GetPostsForUserResponse, error) {
	userId := req.GetValue()
	var meta metadata.MD
	if md, ok := metadata.FromIncomingContext(ctx); ok {
		meta = md
	}

	var wg sync.WaitGroup

	// channels
	tripsChan := make(chan []*pb.Trip)
	eventsChan := make(chan []*pb.ProcheEvent)
	tasksChan := make(chan []*pb.ProcheTask)
	giveawaysChan := make(chan []*pb.GiveAway)

	wg.Add(1)
	go func() {
		cursor, err := s.tripCol.Find(context.Background(), bson.M{"userid": userId}, util.PaginateFilter(meta))
		if err != nil {
			tripsChan <- nil
		}
		defer func(cursor *mongo.Cursor, ctx context.Context) {
			_ = cursor.Close(ctx)
		}(cursor, context.Background())

		var trips []*pb.Trip
		_ = cursor.All(context.Background(), &trips)
		log.Printf("trips -> %v\n", &trips)
		wg.Done()
		tripsChan <- trips
	}()

	wg.Add(1)
	go func() {
		cursor, err := s.eventCol.Find(context.Background(), bson.M{"userid": userId}, util.PaginateFilter(meta))
		if err != nil {
			eventsChan <- nil
		}
		defer func(cursor *mongo.Cursor, ctx context.Context) {
			_ = cursor.Close(ctx)
		}(cursor, context.Background())

		var events []*pb.ProcheEvent
		_ = cursor.All(context.Background(), &events)
		log.Printf("events -> %v\n", &events)
		wg.Done()
		eventsChan <- events
	}()

	wg.Add(1)
	go func() {
		cursor, err := s.taskCol.Find(context.Background(), bson.M{"userid": userId}, util.PaginateFilter(meta))
		if err != nil {
			tasksChan <- nil
		}
		defer func(cursor *mongo.Cursor, ctx context.Context) {
			_ = cursor.Close(ctx)
		}(cursor, context.Background())

		var tasks []*pb.ProcheTask
		_ = cursor.All(context.Background(), &tasks)

		for _, task := range tasks {
			if count, err := s.candidatesCol.CountDocuments(context.Background(), bson.M{"taskid": task.Id}); err == nil {
				task.NumberOfApplicants = int32(count)
			}
		}

		log.Printf("tasks -> %v\n", &tasks)
		wg.Done()
		tasksChan <- tasks
	}()

	wg.Add(1)
	go func() {
		cursor, err := s.giveAwayCol.Find(context.Background(), bson.M{"owner": userId}, util.PaginateFilter(meta))
		if err != nil {
			giveawaysChan <- nil
		}

		defer func(cursor *mongo.Cursor, ctx context.Context) {
			_ = cursor.Close(ctx)
		}(cursor, context.Background())
		var giveaways []*pb.GiveAway
		_ = cursor.All(context.Background(), &giveaways)
		log.Printf("giveaways -> %v\n", &giveaways)
		wg.Done()
		giveawaysChan <- giveaways
	}()

	wg.Wait()

	response := &pb.GetPostsForUserResponse{}
	response.Tasks = <-tasksChan
	response.Events = <-eventsChan
	response.Giveaways = <-giveawaysChan
	response.Trips = <-tripsChan

	return response, nil
}
