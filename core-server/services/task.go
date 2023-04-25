package services

import (
	"context"
	"github.com/quabynah-bilson/core-server/config"
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
	"time"
)

type ProcheTaskServer struct {
	pb.UnimplementedTaskServiceServer
	taskCol       *mongo.Collection
	taskEventCol  *mongo.Collection
	candidatesCol *mongo.Collection
}

func NewProcheTaskServerInstance(taskCol *mongo.Collection, taskEventCol *mongo.Collection, candidatesCol *mongo.Collection) *ProcheTaskServer {
	return &ProcheTaskServer{
		UnimplementedTaskServiceServer: pb.UnimplementedTaskServiceServer{},
		taskCol:                        taskCol,
		taskEventCol:                   taskEventCol,
		candidatesCol:                  candidatesCol,
	}
}

// ApplyForTask
// done
func (s *ProcheTaskServer) ApplyForTask(ctx context.Context, req *pb.ApplyForTaskRequest) (*emptypb.Empty, error) {

	ctx, cancel := context.WithDeadline(ctx, time.Now().Add(time.Second*30))
	defer cancel()

	// get candidate
	candidateId := req.GetUserId()

	// check if candidate has already applied for task
	if count, _ := s.candidatesCol.CountDocuments(ctx, bson.M{"account.owner.id": candidateId}); count != 0 {
		return nil, status.Errorf(codes.AlreadyExists, "candidate has already applied for task")
	}

	// get task id
	taskId := req.GetTaskId()

	var task pb.ProcheTask
	if err := s.taskCol.FindOne(ctx, bson.M{"id": taskId}).Decode(&task); err != nil {
		return nil, status.Errorf(codes.Internal, "failed to get task: %v", err)
	}

	// check if candidate has a business account
	if account, err := config.CreateAuthClient().GetBusinessAccount(ctx, &wrapperspb.StringValue{Value: candidateId}); err != nil {
		return nil, err
	} else {
		candidate := &pb.TaskCandidate{
			Id:        primitive.NewObjectID().Hex(),
			TaskId:    req.GetTaskId(),
			Account:   account,
			CreatedAt: timestamppb.Now(),
			UpdatedAt: timestamppb.Now(),
			Hired:     false,
		}

		// add to candidates
		if result, err := s.candidatesCol.InsertOne(ctx, candidate, nil); err != nil {
			log.Printf("unable to complete application for this task: %v", err)
			return nil, status.Errorf(codes.Internal, "unable to complete application for this task")
		} else {
			go func(res *mongo.InsertOneResult, candidate *pb.TaskCandidate, col *mongo.Collection) {
				candidate.Id = res.InsertedID.(primitive.ObjectID).Hex()
				_, _ = col.ReplaceOne(context.Background(), bson.M{"_id": res.InsertedID.(primitive.ObjectID)}, &candidate)
			}(result, candidate, s.candidatesCol)
		}

		return &emptypb.Empty{}, nil
	}
}

// GetCandidatesForTask
// done
func (s *ProcheTaskServer) GetCandidatesForTask(req *wrapperspb.StringValue, stream pb.TaskService_GetCandidatesForTaskServer) error {
	ctx := stream.Context()

	response := &pb.TaskCandidateList{}
	var candidates []*pb.TaskCandidate
	if cursor, err := s.candidatesCol.Find(ctx, bson.M{"taskid": req.GetValue()}); err != nil {
		log.Printf("unable to find candidates for this task: %v", err)
		return status.Errorf(codes.Internal, "unable to find candidates for this task")
	} else {
		_ = cursor.All(ctx, &candidates)
		response.Candidates = candidates
	}
	_ = stream.Send(response)

	// create a change stream option
	changeStreamOptions := options.ChangeStream().SetFullDocument(options.UpdateLookup)

	// create a new aggregation pipeline
	pipeline := mongo.Pipeline{}

	// create a watch stream for the tasks collection
	if watchStream, err := s.candidatesCol.Watch(ctx, pipeline, changeStreamOptions); err != nil {
		return status.Errorf(codes.Internal, "failed to create watch stream: %v", err)
	} else {
		var candidates []*pb.TaskCandidate

		// iterate over watch stream
		for watchStream.Next(ctx) {
			// create task
			var candidate util.MongoDocToProto[*pb.TaskCandidate]

			// decode candidate
			if err := watchStream.Decode(&candidate); err != nil {
				return status.Errorf(codes.Internal, "failed to decode candidate: %v", err)
			}

			// append candidate to candidate list
			response.Candidates = append(candidates, candidate.FullDocument)

			// send task list
			if err := stream.Send(response); err != nil {
				return status.Errorf(codes.Internal, "failed to push candidate data: %v", err)
			}
		}

		// close watch stream
		defer func(watchStream *mongo.ChangeStream, ctx context.Context) {
			_ = watchStream.Close(ctx)
		}(watchStream, ctx)
	}

	return nil
}

// CreateTask creates a new task
// done
func (s *ProcheTaskServer) CreateTask(ctx context.Context, req *pb.CreateTaskRequest) (*pb.ProcheTask, error) {
	// get request charge per hour
	chargePerHour := req.GetChargePerHour()

	imageUrl := req.GetImageUrl()

	// create task
	task := pb.ProcheTask{
		Title:         req.GetTitle(),
		Description:   req.GetDescription(),
		CreatedAt:     timestamppb.Now(),
		UpdatedAt:     timestamppb.Now(),
		DueDate:       req.GetDueDate(),
		Duration:      req.GetDuration(),
		Completed:     false,
		ChargePerHour: &chargePerHour,
		UserId:        req.GetUserId(),
		Address:       req.GetAddress(),
		ImageUrl:      &imageUrl,
	}

	// insert task into database
	if insertResultId, err := s.taskCol.InsertOne(ctx, &task); err != nil {
		return nil, status.Errorf(codes.Internal, "failed to create task: %v", err)
	} else {
		// update task id with insertResultId
		task.Id = insertResultId.InsertedID.(primitive.ObjectID).Hex()

		go func(task *pb.ProcheTask, col *mongo.Collection) {
			// save to database
			if _, err := col.ReplaceOne(context.Background(), bson.M{"title": task.GetTitle()}, &task); err != nil {
				log.Fatalf("failed to update task: %v", err)
			}
		}(&task, s.taskCol)
		return &task, nil
	}
}

// GetTask gets a task by id
// done
func (s *ProcheTaskServer) GetTask(req *wrapperspb.StringValue, stream pb.TaskService_GetTaskServer) error {
	metadata.FromIncomingContext(stream.Context())

	// get context from stream
	ctx := stream.Context()

	// get task id
	taskId := req.GetValue()

	// get task from database
	var task pb.ProcheTask
	if err := s.taskCol.FindOne(ctx, bson.M{"id": taskId}).Decode(&task); err != nil {
		return status.Errorf(codes.Internal, "failed to get task: %v", err)
	} else {
		// count number of candidates
		if count, err := s.candidatesCol.CountDocuments(ctx, bson.M{"taskid": taskId}); err == nil {
			task.NumberOfApplicants = int32(count)
		}

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
			var task util.MongoDocToProto[*pb.ProcheTask]
			// decode task
			if err := watchStream.Decode(&task); err != nil {
				return status.Errorf(codes.Internal, "failed to decode task: %v", err)
			}

			// check if task id is equal to the task id in the request
			if task.FullDocument.GetId() != taskId {
				continue
			}

			// count number of candidates
			if count, err := s.candidatesCol.CountDocuments(ctx, bson.M{"taskid": taskId}); err == nil {
				task.FullDocument.NumberOfApplicants = int32(count)
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
func (s *ProcheTaskServer) GetTasks(_ *pb.CommonAddress, stream pb.TaskService_GetTasksServer) error {
	// TODO -> use location to get tasks

	// get context from stream
	ctx := stream.Context()

	// get all tasks
	md, _ := metadata.FromIncomingContext(ctx)
	if cursor, err := s.taskCol.Find(ctx, bson.D{}, util.PaginateFilter(md)); err != nil {
		return status.Errorf(codes.Internal, "failed to get tasks: %v", err)
	} else {
		// create a `TaskList` object
		var taskList pb.TaskList

		// iterate over tasks
		for cursor.Next(ctx) {
			// create task
			var task pb.ProcheTask
			// decode task
			if err := cursor.Decode(&task); err != nil {
				return status.Errorf(codes.Internal, "failed to decode task: %v", err)
			}

			// count number of candidates
			if count, err := s.candidatesCol.CountDocuments(ctx, bson.M{"taskid": task.GetId()}); err == nil {
				task.NumberOfApplicants = int32(count)
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
			var task util.MongoDocToProto[*pb.ProcheTask]

			// decode task
			if err := watchStream.Decode(&task); err != nil {
				return status.Errorf(codes.Internal, "failed to decode task: %v", err)
			}

			if task.FullDocument == nil {
				continue
			}

			// count number of candidates
			if count, err := s.candidatesCol.CountDocuments(ctx, bson.M{"taskid": task.FullDocument.GetId()}); err == nil {
				task.FullDocument.NumberOfApplicants = int32(count)
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

// DeleteTask deletes a task by id
// done
func (s *ProcheTaskServer) DeleteTask(ctx context.Context, req *wrapperspb.StringValue) (*emptypb.Empty, error) {
	// get task id
	taskId := req.GetValue()

	// delete task from database
	if err := s.taskCol.FindOneAndDelete(ctx, bson.M{"id": taskId}).Decode(&bson.M{}); err != nil {
		return nil, status.Errorf(codes.Internal, "failed to delete task: %v", err)
	}

	return &emptypb.Empty{}, nil
}

func (s *ProcheTaskServer) UpdateTask(ctx context.Context, req *pb.UpdateTaskRequest) (*pb.ProcheTask, error) {
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
