// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.15.8
// source: task.proto

package core

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	wrapperspb "google.golang.org/protobuf/types/known/wrapperspb"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// TaskServiceClient is the client API for TaskService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type TaskServiceClient interface {
	// task related operations
	CreateTask(ctx context.Context, in *CreateTaskRequest, opts ...grpc.CallOption) (*Task, error)
	GetTask(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskClient, error)
	GetTasks(ctx context.Context, in *CommonAddress, opts ...grpc.CallOption) (TaskService_GetTasksClient, error)
	UpdateTask(ctx context.Context, in *UpdateTaskRequest, opts ...grpc.CallOption) (*Task, error)
	DeleteTask(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error)
	// task event related operations
	CreateTaskEvent(ctx context.Context, in *CreateTaskEventRequest, opts ...grpc.CallOption) (*TaskEvent, error)
	GetTaskEvent(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskEventClient, error)
	GetTaskEvents(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskEventsClient, error)
	CancelTaskEvent(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*TaskEvent, error)
	CompleteTaskEvent(ctx context.Context, in *CompleteTaskEventRequest, opts ...grpc.CallOption) (*TaskEvent, error)
	GetTaskEventsForUser(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskEventsForUserClient, error)
	GetTaskEventsForTask(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskEventsForTaskClient, error)
	GetTaskEventsForUserAndTask(ctx context.Context, in *TaskEventRequest, opts ...grpc.CallOption) (TaskService_GetTaskEventsForUserAndTaskClient, error)
	DeleteTaskEvent(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error)
	DeleteTaskEventsForTask(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error)
	DeleteTaskEventsForUser(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error)
	DeleteTaskEventsForUserAndTask(ctx context.Context, in *TaskEventRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
}

type taskServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewTaskServiceClient(cc grpc.ClientConnInterface) TaskServiceClient {
	return &taskServiceClient{cc}
}

func (c *taskServiceClient) CreateTask(ctx context.Context, in *CreateTaskRequest, opts ...grpc.CallOption) (*Task, error) {
	out := new(Task)
	err := c.cc.Invoke(ctx, "/task.TaskService/create_task", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) GetTask(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskClient, error) {
	stream, err := c.cc.NewStream(ctx, &TaskService_ServiceDesc.Streams[0], "/task.TaskService/get_task", opts...)
	if err != nil {
		return nil, err
	}
	x := &taskServiceGetTaskClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TaskService_GetTaskClient interface {
	Recv() (*Task, error)
	grpc.ClientStream
}

type taskServiceGetTaskClient struct {
	grpc.ClientStream
}

func (x *taskServiceGetTaskClient) Recv() (*Task, error) {
	m := new(Task)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *taskServiceClient) GetTasks(ctx context.Context, in *CommonAddress, opts ...grpc.CallOption) (TaskService_GetTasksClient, error) {
	stream, err := c.cc.NewStream(ctx, &TaskService_ServiceDesc.Streams[1], "/task.TaskService/get_tasks", opts...)
	if err != nil {
		return nil, err
	}
	x := &taskServiceGetTasksClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TaskService_GetTasksClient interface {
	Recv() (*TaskList, error)
	grpc.ClientStream
}

type taskServiceGetTasksClient struct {
	grpc.ClientStream
}

func (x *taskServiceGetTasksClient) Recv() (*TaskList, error) {
	m := new(TaskList)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *taskServiceClient) UpdateTask(ctx context.Context, in *UpdateTaskRequest, opts ...grpc.CallOption) (*Task, error) {
	out := new(Task)
	err := c.cc.Invoke(ctx, "/task.TaskService/update_task", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) DeleteTask(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/task.TaskService/delete_task", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) CreateTaskEvent(ctx context.Context, in *CreateTaskEventRequest, opts ...grpc.CallOption) (*TaskEvent, error) {
	out := new(TaskEvent)
	err := c.cc.Invoke(ctx, "/task.TaskService/create_task_event", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) GetTaskEvent(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskEventClient, error) {
	stream, err := c.cc.NewStream(ctx, &TaskService_ServiceDesc.Streams[2], "/task.TaskService/get_task_event", opts...)
	if err != nil {
		return nil, err
	}
	x := &taskServiceGetTaskEventClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TaskService_GetTaskEventClient interface {
	Recv() (*TaskEvent, error)
	grpc.ClientStream
}

type taskServiceGetTaskEventClient struct {
	grpc.ClientStream
}

func (x *taskServiceGetTaskEventClient) Recv() (*TaskEvent, error) {
	m := new(TaskEvent)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *taskServiceClient) GetTaskEvents(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskEventsClient, error) {
	stream, err := c.cc.NewStream(ctx, &TaskService_ServiceDesc.Streams[3], "/task.TaskService/get_task_events", opts...)
	if err != nil {
		return nil, err
	}
	x := &taskServiceGetTaskEventsClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TaskService_GetTaskEventsClient interface {
	Recv() (*TaskEventList, error)
	grpc.ClientStream
}

type taskServiceGetTaskEventsClient struct {
	grpc.ClientStream
}

func (x *taskServiceGetTaskEventsClient) Recv() (*TaskEventList, error) {
	m := new(TaskEventList)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *taskServiceClient) CancelTaskEvent(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*TaskEvent, error) {
	out := new(TaskEvent)
	err := c.cc.Invoke(ctx, "/task.TaskService/cancel_task_event", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) CompleteTaskEvent(ctx context.Context, in *CompleteTaskEventRequest, opts ...grpc.CallOption) (*TaskEvent, error) {
	out := new(TaskEvent)
	err := c.cc.Invoke(ctx, "/task.TaskService/complete_task_event", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) GetTaskEventsForUser(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskEventsForUserClient, error) {
	stream, err := c.cc.NewStream(ctx, &TaskService_ServiceDesc.Streams[4], "/task.TaskService/get_task_events_for_user", opts...)
	if err != nil {
		return nil, err
	}
	x := &taskServiceGetTaskEventsForUserClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TaskService_GetTaskEventsForUserClient interface {
	Recv() (*TaskEventList, error)
	grpc.ClientStream
}

type taskServiceGetTaskEventsForUserClient struct {
	grpc.ClientStream
}

func (x *taskServiceGetTaskEventsForUserClient) Recv() (*TaskEventList, error) {
	m := new(TaskEventList)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *taskServiceClient) GetTaskEventsForTask(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (TaskService_GetTaskEventsForTaskClient, error) {
	stream, err := c.cc.NewStream(ctx, &TaskService_ServiceDesc.Streams[5], "/task.TaskService/get_task_events_for_task", opts...)
	if err != nil {
		return nil, err
	}
	x := &taskServiceGetTaskEventsForTaskClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TaskService_GetTaskEventsForTaskClient interface {
	Recv() (*TaskEventList, error)
	grpc.ClientStream
}

type taskServiceGetTaskEventsForTaskClient struct {
	grpc.ClientStream
}

func (x *taskServiceGetTaskEventsForTaskClient) Recv() (*TaskEventList, error) {
	m := new(TaskEventList)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *taskServiceClient) GetTaskEventsForUserAndTask(ctx context.Context, in *TaskEventRequest, opts ...grpc.CallOption) (TaskService_GetTaskEventsForUserAndTaskClient, error) {
	stream, err := c.cc.NewStream(ctx, &TaskService_ServiceDesc.Streams[6], "/task.TaskService/get_task_events_for_user_and_task", opts...)
	if err != nil {
		return nil, err
	}
	x := &taskServiceGetTaskEventsForUserAndTaskClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TaskService_GetTaskEventsForUserAndTaskClient interface {
	Recv() (*TaskEventList, error)
	grpc.ClientStream
}

type taskServiceGetTaskEventsForUserAndTaskClient struct {
	grpc.ClientStream
}

func (x *taskServiceGetTaskEventsForUserAndTaskClient) Recv() (*TaskEventList, error) {
	m := new(TaskEventList)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *taskServiceClient) DeleteTaskEvent(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/task.TaskService/delete_task_event", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) DeleteTaskEventsForTask(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/task.TaskService/delete_task_events_for_task", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) DeleteTaskEventsForUser(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/task.TaskService/delete_task_events_for_user", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *taskServiceClient) DeleteTaskEventsForUserAndTask(ctx context.Context, in *TaskEventRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/task.TaskService/delete_task_events_for_user_and_task", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// TaskServiceServer is the server API for TaskService service.
// All implementations must embed UnimplementedTaskServiceServer
// for forward compatibility
type TaskServiceServer interface {
	// task related operations
	CreateTask(context.Context, *CreateTaskRequest) (*Task, error)
	GetTask(*wrapperspb.StringValue, TaskService_GetTaskServer) error
	GetTasks(*CommonAddress, TaskService_GetTasksServer) error
	UpdateTask(context.Context, *UpdateTaskRequest) (*Task, error)
	DeleteTask(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error)
	// task event related operations
	CreateTaskEvent(context.Context, *CreateTaskEventRequest) (*TaskEvent, error)
	GetTaskEvent(*wrapperspb.StringValue, TaskService_GetTaskEventServer) error
	GetTaskEvents(*wrapperspb.StringValue, TaskService_GetTaskEventsServer) error
	CancelTaskEvent(context.Context, *wrapperspb.StringValue) (*TaskEvent, error)
	CompleteTaskEvent(context.Context, *CompleteTaskEventRequest) (*TaskEvent, error)
	GetTaskEventsForUser(*wrapperspb.StringValue, TaskService_GetTaskEventsForUserServer) error
	GetTaskEventsForTask(*wrapperspb.StringValue, TaskService_GetTaskEventsForTaskServer) error
	GetTaskEventsForUserAndTask(*TaskEventRequest, TaskService_GetTaskEventsForUserAndTaskServer) error
	DeleteTaskEvent(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error)
	DeleteTaskEventsForTask(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error)
	DeleteTaskEventsForUser(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error)
	DeleteTaskEventsForUserAndTask(context.Context, *TaskEventRequest) (*emptypb.Empty, error)
	mustEmbedUnimplementedTaskServiceServer()
}

// UnimplementedTaskServiceServer must be embedded to have forward compatible implementations.
type UnimplementedTaskServiceServer struct {
}

func (UnimplementedTaskServiceServer) CreateTask(context.Context, *CreateTaskRequest) (*Task, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateTask not implemented")
}
func (UnimplementedTaskServiceServer) GetTask(*wrapperspb.StringValue, TaskService_GetTaskServer) error {
	return status.Errorf(codes.Unimplemented, "method GetTask not implemented")
}
func (UnimplementedTaskServiceServer) GetTasks(*CommonAddress, TaskService_GetTasksServer) error {
	return status.Errorf(codes.Unimplemented, "method GetTasks not implemented")
}
func (UnimplementedTaskServiceServer) UpdateTask(context.Context, *UpdateTaskRequest) (*Task, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateTask not implemented")
}
func (UnimplementedTaskServiceServer) DeleteTask(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteTask not implemented")
}
func (UnimplementedTaskServiceServer) CreateTaskEvent(context.Context, *CreateTaskEventRequest) (*TaskEvent, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateTaskEvent not implemented")
}
func (UnimplementedTaskServiceServer) GetTaskEvent(*wrapperspb.StringValue, TaskService_GetTaskEventServer) error {
	return status.Errorf(codes.Unimplemented, "method GetTaskEvent not implemented")
}
func (UnimplementedTaskServiceServer) GetTaskEvents(*wrapperspb.StringValue, TaskService_GetTaskEventsServer) error {
	return status.Errorf(codes.Unimplemented, "method GetTaskEvents not implemented")
}
func (UnimplementedTaskServiceServer) CancelTaskEvent(context.Context, *wrapperspb.StringValue) (*TaskEvent, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CancelTaskEvent not implemented")
}
func (UnimplementedTaskServiceServer) CompleteTaskEvent(context.Context, *CompleteTaskEventRequest) (*TaskEvent, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CompleteTaskEvent not implemented")
}
func (UnimplementedTaskServiceServer) GetTaskEventsForUser(*wrapperspb.StringValue, TaskService_GetTaskEventsForUserServer) error {
	return status.Errorf(codes.Unimplemented, "method GetTaskEventsForUser not implemented")
}
func (UnimplementedTaskServiceServer) GetTaskEventsForTask(*wrapperspb.StringValue, TaskService_GetTaskEventsForTaskServer) error {
	return status.Errorf(codes.Unimplemented, "method GetTaskEventsForTask not implemented")
}
func (UnimplementedTaskServiceServer) GetTaskEventsForUserAndTask(*TaskEventRequest, TaskService_GetTaskEventsForUserAndTaskServer) error {
	return status.Errorf(codes.Unimplemented, "method GetTaskEventsForUserAndTask not implemented")
}
func (UnimplementedTaskServiceServer) DeleteTaskEvent(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteTaskEvent not implemented")
}
func (UnimplementedTaskServiceServer) DeleteTaskEventsForTask(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteTaskEventsForTask not implemented")
}
func (UnimplementedTaskServiceServer) DeleteTaskEventsForUser(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteTaskEventsForUser not implemented")
}
func (UnimplementedTaskServiceServer) DeleteTaskEventsForUserAndTask(context.Context, *TaskEventRequest) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteTaskEventsForUserAndTask not implemented")
}
func (UnimplementedTaskServiceServer) mustEmbedUnimplementedTaskServiceServer() {}

// UnsafeTaskServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to TaskServiceServer will
// result in compilation errors.
type UnsafeTaskServiceServer interface {
	mustEmbedUnimplementedTaskServiceServer()
}

func RegisterTaskServiceServer(s grpc.ServiceRegistrar, srv TaskServiceServer) {
	s.RegisterService(&TaskService_ServiceDesc, srv)
}

func _TaskService_CreateTask_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateTaskRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).CreateTask(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/create_task",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).CreateTask(ctx, req.(*CreateTaskRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_GetTask_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(wrapperspb.StringValue)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TaskServiceServer).GetTask(m, &taskServiceGetTaskServer{stream})
}

type TaskService_GetTaskServer interface {
	Send(*Task) error
	grpc.ServerStream
}

type taskServiceGetTaskServer struct {
	grpc.ServerStream
}

func (x *taskServiceGetTaskServer) Send(m *Task) error {
	return x.ServerStream.SendMsg(m)
}

func _TaskService_GetTasks_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(CommonAddress)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TaskServiceServer).GetTasks(m, &taskServiceGetTasksServer{stream})
}

type TaskService_GetTasksServer interface {
	Send(*TaskList) error
	grpc.ServerStream
}

type taskServiceGetTasksServer struct {
	grpc.ServerStream
}

func (x *taskServiceGetTasksServer) Send(m *TaskList) error {
	return x.ServerStream.SendMsg(m)
}

func _TaskService_UpdateTask_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdateTaskRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).UpdateTask(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/update_task",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).UpdateTask(ctx, req.(*UpdateTaskRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_DeleteTask_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).DeleteTask(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/delete_task",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).DeleteTask(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_CreateTaskEvent_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateTaskEventRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).CreateTaskEvent(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/create_task_event",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).CreateTaskEvent(ctx, req.(*CreateTaskEventRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_GetTaskEvent_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(wrapperspb.StringValue)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TaskServiceServer).GetTaskEvent(m, &taskServiceGetTaskEventServer{stream})
}

type TaskService_GetTaskEventServer interface {
	Send(*TaskEvent) error
	grpc.ServerStream
}

type taskServiceGetTaskEventServer struct {
	grpc.ServerStream
}

func (x *taskServiceGetTaskEventServer) Send(m *TaskEvent) error {
	return x.ServerStream.SendMsg(m)
}

func _TaskService_GetTaskEvents_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(wrapperspb.StringValue)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TaskServiceServer).GetTaskEvents(m, &taskServiceGetTaskEventsServer{stream})
}

type TaskService_GetTaskEventsServer interface {
	Send(*TaskEventList) error
	grpc.ServerStream
}

type taskServiceGetTaskEventsServer struct {
	grpc.ServerStream
}

func (x *taskServiceGetTaskEventsServer) Send(m *TaskEventList) error {
	return x.ServerStream.SendMsg(m)
}

func _TaskService_CancelTaskEvent_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).CancelTaskEvent(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/cancel_task_event",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).CancelTaskEvent(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_CompleteTaskEvent_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CompleteTaskEventRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).CompleteTaskEvent(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/complete_task_event",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).CompleteTaskEvent(ctx, req.(*CompleteTaskEventRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_GetTaskEventsForUser_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(wrapperspb.StringValue)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TaskServiceServer).GetTaskEventsForUser(m, &taskServiceGetTaskEventsForUserServer{stream})
}

type TaskService_GetTaskEventsForUserServer interface {
	Send(*TaskEventList) error
	grpc.ServerStream
}

type taskServiceGetTaskEventsForUserServer struct {
	grpc.ServerStream
}

func (x *taskServiceGetTaskEventsForUserServer) Send(m *TaskEventList) error {
	return x.ServerStream.SendMsg(m)
}

func _TaskService_GetTaskEventsForTask_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(wrapperspb.StringValue)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TaskServiceServer).GetTaskEventsForTask(m, &taskServiceGetTaskEventsForTaskServer{stream})
}

type TaskService_GetTaskEventsForTaskServer interface {
	Send(*TaskEventList) error
	grpc.ServerStream
}

type taskServiceGetTaskEventsForTaskServer struct {
	grpc.ServerStream
}

func (x *taskServiceGetTaskEventsForTaskServer) Send(m *TaskEventList) error {
	return x.ServerStream.SendMsg(m)
}

func _TaskService_GetTaskEventsForUserAndTask_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(TaskEventRequest)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TaskServiceServer).GetTaskEventsForUserAndTask(m, &taskServiceGetTaskEventsForUserAndTaskServer{stream})
}

type TaskService_GetTaskEventsForUserAndTaskServer interface {
	Send(*TaskEventList) error
	grpc.ServerStream
}

type taskServiceGetTaskEventsForUserAndTaskServer struct {
	grpc.ServerStream
}

func (x *taskServiceGetTaskEventsForUserAndTaskServer) Send(m *TaskEventList) error {
	return x.ServerStream.SendMsg(m)
}

func _TaskService_DeleteTaskEvent_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).DeleteTaskEvent(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/delete_task_event",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).DeleteTaskEvent(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_DeleteTaskEventsForTask_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).DeleteTaskEventsForTask(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/delete_task_events_for_task",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).DeleteTaskEventsForTask(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_DeleteTaskEventsForUser_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).DeleteTaskEventsForUser(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/delete_task_events_for_user",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).DeleteTaskEventsForUser(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _TaskService_DeleteTaskEventsForUserAndTask_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(TaskEventRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TaskServiceServer).DeleteTaskEventsForUserAndTask(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/task.TaskService/delete_task_events_for_user_and_task",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TaskServiceServer).DeleteTaskEventsForUserAndTask(ctx, req.(*TaskEventRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// TaskService_ServiceDesc is the grpc.ServiceDesc for TaskService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var TaskService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "task.TaskService",
	HandlerType: (*TaskServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "create_task",
			Handler:    _TaskService_CreateTask_Handler,
		},
		{
			MethodName: "update_task",
			Handler:    _TaskService_UpdateTask_Handler,
		},
		{
			MethodName: "delete_task",
			Handler:    _TaskService_DeleteTask_Handler,
		},
		{
			MethodName: "create_task_event",
			Handler:    _TaskService_CreateTaskEvent_Handler,
		},
		{
			MethodName: "cancel_task_event",
			Handler:    _TaskService_CancelTaskEvent_Handler,
		},
		{
			MethodName: "complete_task_event",
			Handler:    _TaskService_CompleteTaskEvent_Handler,
		},
		{
			MethodName: "delete_task_event",
			Handler:    _TaskService_DeleteTaskEvent_Handler,
		},
		{
			MethodName: "delete_task_events_for_task",
			Handler:    _TaskService_DeleteTaskEventsForTask_Handler,
		},
		{
			MethodName: "delete_task_events_for_user",
			Handler:    _TaskService_DeleteTaskEventsForUser_Handler,
		},
		{
			MethodName: "delete_task_events_for_user_and_task",
			Handler:    _TaskService_DeleteTaskEventsForUserAndTask_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "get_task",
			Handler:       _TaskService_GetTask_Handler,
			ServerStreams: true,
		},
		{
			StreamName:    "get_tasks",
			Handler:       _TaskService_GetTasks_Handler,
			ServerStreams: true,
		},
		{
			StreamName:    "get_task_event",
			Handler:       _TaskService_GetTaskEvent_Handler,
			ServerStreams: true,
		},
		{
			StreamName:    "get_task_events",
			Handler:       _TaskService_GetTaskEvents_Handler,
			ServerStreams: true,
		},
		{
			StreamName:    "get_task_events_for_user",
			Handler:       _TaskService_GetTaskEventsForUser_Handler,
			ServerStreams: true,
		},
		{
			StreamName:    "get_task_events_for_task",
			Handler:       _TaskService_GetTaskEventsForTask_Handler,
			ServerStreams: true,
		},
		{
			StreamName:    "get_task_events_for_user_and_task",
			Handler:       _TaskService_GetTaskEventsForUserAndTask_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "task.proto",
}
