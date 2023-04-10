package services

import (
	"context"
	pb "github.com/quabynah-bilson/core-server/gen"
	"go.mongodb.org/mongo-driver/mongo"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

type ProcheTaskServer struct {
	pb.UnimplementedTaskServiceServer
	taskCol      *mongo.Collection
	taskEventCol *mongo.Collection
}

func NewProcheTaskServerInstance(taskCol *mongo.Collection, taskEventCol *mongo.Collection) *ProcheTaskServer {
	return &ProcheTaskServer{
		UnimplementedTaskServiceServer: pb.UnimplementedTaskServiceServer{},
		taskCol:                        taskCol,
		taskEventCol:                   taskEventCol,
	}
}

func (s *ProcheTaskServer) CreateTask(ctx context.Context, req *pb.CreateTaskRequest) (*pb.Task, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) GetTask(req *wrapperspb.StringValue, stream pb.TaskService_GetTaskServer) error {
	panic("implement me")
}

func (s *ProcheTaskServer) GetTasks(req *emptypb.Empty, stream pb.TaskService_GetTasksServer) error {
	panic("implement me")
}

func (s *ProcheTaskServer) DeleteTask(ctx context.Context, req *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) UpdateTask(ctx context.Context, req *pb.UpdateTaskRequest) (*pb.Task, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) CreateTaskEvent(ctx context.Context, req *pb.CreateTaskEventRequest) (*pb.TaskEvent, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) GetTaskEvent(req *wrapperspb.StringValue, stream pb.TaskService_GetTaskEventServer) error {
	panic("implement me")
}

func (s *ProcheTaskServer) GetTaskEvents(req *wrapperspb.StringValue, stream pb.TaskService_GetTaskEventsServer) error {
	panic("implement me")
}

func (s *ProcheTaskServer) GetTaskEventsForUser(req *wrapperspb.StringValue, stream pb.TaskService_GetTaskEventsForUserServer) error {
	panic("implement me")
}

func (s *ProcheTaskServer) GetTaskEventsForUserAndTask(req *pb.TaskEventRequest, stream pb.TaskService_GetTaskEventsForUserAndTaskServer) error {
	panic("implement me")
}

func (s *ProcheTaskServer) CancelTaskEvent(ctx context.Context, req *wrapperspb.StringValue) (*pb.TaskEvent, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) CompleteTaskEvent(ctx context.Context, req *pb.CompleteTaskEventRequest) (*pb.TaskEvent, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) GetTaskEventsForTask(req *wrapperspb.StringValue, stream pb.TaskService_GetTaskEventsForTaskServer) error {
	panic("implement me")
}

func (s *ProcheTaskServer) DeleteTaskEvent(ctx context.Context, req *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) DeleteTaskEventsForTask(ctx context.Context, req *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) DeleteTaskEventsForUser(ctx context.Context, req *wrapperspb.StringValue) (*emptypb.Empty, error) {
	panic("implement me")
}

func (s *ProcheTaskServer) DeleteTaskEventsForUserAndTask(context.Context, *pb.TaskEventRequest) (*emptypb.Empty, error) {
	panic("implement me")
}
