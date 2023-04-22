package services

import (
	"context"
	pb "github.com/quabynah-bilson/notification-server/gen"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

type NotificationServiceImpl struct {
	pb.UnimplementedNotificationServiceServer
}

func NewNotificationServiceInstance() *NotificationServiceImpl {
	return &NotificationServiceImpl{
		UnimplementedNotificationServiceServer: pb.UnimplementedNotificationServiceServer{},
	}
}

func (n *NotificationServiceImpl) SendNotification(ctx context.Context, req *pb.NotificationRequest) (*emptypb.Empty, error) {
	return &emptypb.Empty{}, nil
}

func (n *NotificationServiceImpl) SendNotificationToAll(ctx context.Context, req *pb.NotificationRequest) (*emptypb.Empty, error) {
	return &emptypb.Empty{}, nil
}

func (n *NotificationServiceImpl) GetNotifications(deviceId *wrapperspb.StringValue, srv pb.NotificationService_GetNotificationsServer) error {
	return nil
}
