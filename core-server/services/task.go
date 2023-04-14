package services

import (
	"context"
	pb "github.com/quabynah-bilson/core-server/gen"
	"github.com/quabynah-bilson/core-server/util"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/timestamppb"
	"google.golang.org/protobuf/types/known/wrapperspb"
	"log"
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

// CreateTask creates a new task
// done
func (s *ProcheTaskServer) CreateTask(ctx context.Context, req *pb.CreateTaskRequest) (*pb.Task, error) {
	// get request charge per hour
	chargePerHour := req.GetChargePerHour()

	// create task
	task := pb.Task{
		Title:         req.GetTitle(),
		Description:   req.GetDescription(),
		CreatedAt:     timestamppb.Now(),
		UpdatedAt:     timestamppb.Now(),
		DueDate:       req.GetDueDate(),
		Duration:      req.GetDuration(),
		Completed:     false,
		ChargePerHour: &chargePerHour,
		UserId:        req.GetUserId(),
	}

	// insert task into database
	if insertResultId, err := s.taskCol.InsertOne(ctx, &task); err != nil {
		return nil, status.Errorf(codes.Internal, "failed to create task: %v", err)
	} else {
		// update task id with insertResultId
		task.Id = insertResultId.InsertedID.(primitive.ObjectID).Hex()

		go func(task *pb.Task) {
			// save to database
			if _, err := s.taskCol.ReplaceOne(context.Background(), bson.M{"title": task.GetTitle()}, &task); err != nil {
				log.Fatalf("failed to update task: %v", err)
			}
		}(&task)
		return &task, nil
	}
}

func (s *ProcheTaskServer) GetTask(req *wrapperspb.StringValue, stream pb.TaskService_GetTaskServer) error {
	metadata.FromIncomingContext(stream.Context())

	// get context from stream
	ctx := stream.Context()

	// get task id
	taskId := req.GetValue()

	// get task from database
	var task pb.Task
	if err := s.taskCol.FindOne(ctx, bson.M{"id": taskId}).Decode(&task); err != nil {
		return status.Errorf(codes.Internal, "failed to get task: %v", err)
	} else {
		// send task
		if err := stream.Send(&task); err != nil {
			return status.Errorf(codes.Internal, "failed to send task: %v", err)
		}
	}

	// create a change stream option
	changeStreamOptions := options.ChangeStream().SetFullDocument(options.UpdateLookup)

	// create a new aggregation pipeline
	pipeline := mongo.Pipeline{}

	// create a watch stream for the tasks collection
	if watchStream, err := s.taskCol.Watch(ctx, pipeline, changeStreamOptions); err != nil {
		return status.Errorf(codes.Internal, "failed to create watch stream: %v", err)
	} else {
		// iterate over watch stream
		for watchStream.Next(ctx) {
			// create task
			var task util.MongoDocToProto[*pb.Task]
			// decode task
			if err := watchStream.Decode(&task); err != nil {
				return status.Errorf(codes.Internal, "failed to decode task: %v", err)
			}

			// check if task id is equal to the task id in the request
			if task.FullDocument.GetId() != taskId {
				continue
			}

			// send task
			if err := stream.Send(task.FullDocument); err != nil {
				return status.Errorf(codes.Internal, "failed to send task: %v", err)
			}
		}
	}

	return nil
}

// GetTasks gets all tasks
// done
func (s *ProcheTaskServer) GetTasks(_ *emptypb.Empty, stream pb.TaskService_GetTasksServer) error {
	// get context from stream
	ctx := stream.Context()

	// get all tasks
	if cursor, err := s.taskCol.Find(ctx, bson.D{}, util.PaginateFilter(1, 10)); err != nil {
		return status.Errorf(codes.Internal, "failed to get tasks: %v", err)
	} else {
		// create a `TaskList` object
		var taskList pb.TaskList

		// iterate over tasks
		for cursor.Next(ctx) {
			// create task
			var task pb.Task
			// decode task
			if err := cursor.Decode(&task); err != nil {
				return status.Errorf(codes.Internal, "failed to decode task: %v", err)
			}

			// append task to task list
			taskList.Tasks = append(taskList.Tasks, &task)

			// send task list
			if err := stream.Send(&taskList); err != nil {
				return status.Errorf(codes.Internal, "failed to send task: %v", err)
			}
		}
	}

	// create a change stream option
	changeStreamOptions := options.ChangeStream().SetFullDocument(options.UpdateLookup)

	// create a new aggregation pipeline
	pipeline := mongo.Pipeline{}

	// create a watch stream for the tasks collection
	if watchStream, err := s.taskCol.Watch(ctx, pipeline, changeStreamOptions); err != nil {
		return status.Errorf(codes.Internal, "failed to create watch stream: %v", err)
	} else {
		// create task list
		var taskList pb.TaskList

		// iterate over watch stream
		for watchStream.Next(ctx) {
			// create task
			var task util.MongoDocToProto[*pb.Task]

			// decode task
			if err := watchStream.Decode(&task); err != nil {
				return status.Errorf(codes.Internal, "failed to decode task: %v", err)
			}

			// append task to task list
			taskList.Tasks = append(taskList.Tasks, task.FullDocument)

			// send task list
			if err := stream.Send(&taskList); err != nil {
				return status.Errorf(codes.Internal, "failed to send task: %v", err)
			}
		}

		// close watch stream
		defer func(watchStream *mongo.ChangeStream, ctx context.Context) {
			_ = watchStream.Close(ctx)
		}(watchStream, ctx)
	}

	return nil
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
