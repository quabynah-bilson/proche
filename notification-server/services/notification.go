package services

import (
	"context"
	"fmt"
	"github.com/jackc/pgx"
	"github.com/quabynah-bilson/notification-server/config"
	pb "github.com/quabynah-bilson/notification-server/gen"
	"github.com/quabynah-bilson/notification-server/utils"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
	"time"
)

type NotificationServiceImpl struct {
	pb.UnimplementedNotificationServiceServer
}

func NewNotificationServiceInstance() *NotificationServiceImpl {
	return &NotificationServiceImpl{
		UnimplementedNotificationServiceServer: pb.UnimplementedNotificationServiceServer{},
	}
}

// RegisterDevice registers a device to the notification server
func (n *NotificationServiceImpl) RegisterDevice(ctx context.Context, req *pb.RegisterDeviceRequest) (*wrapperspb.StringValue, error) {
	// open database
	var dbPool *pgx.Conn
	if db, err := config.InitDatabase(); err != nil {
		return nil, status.Errorf(codes.Internal, "The service is unavailable. Try again later: %v", err)
	} else {
		dbPool = db
	}
	defer func(DbPool *pgx.Conn) {
		_ = DbPool.Close()
	}(dbPool)

	ctx, cancel := context.WithDeadline(ctx, time.Now().Add(time.Second*15))
	defer cancel()

	// generate a random string to be used as the device id
	token := utils.GenerateRandomString(40)

	// insert the device into the database
	if result, err := dbPool.QueryEx(ctx, "SELECT insert_device($1, $2, $3)", nil, req.GetUserId(), req.GetDeviceType(), token); err != nil {
		return nil, status.Errorf(codes.Internal, "Failed to register device: %v", err)
	} else {
		if result.Next() {
			if err := result.Scan(&token); err != nil {
				return nil, status.Errorf(codes.Internal, "Failed to register device: %v", err)
			}
		}
	}

	return &wrapperspb.StringValue{
		Value: token,
	}, nil
}

func (n *NotificationServiceImpl) UnregisterDevice(ctx context.Context, req *wrapperspb.StringValue) (*emptypb.Empty, error) {
	// open database
	var dbPool *pgx.Conn
	if db, err := config.InitDatabase(); err != nil {
		return nil, status.Errorf(codes.Internal, "The service is unavailable. Try again later: %v", err)
	} else {
		dbPool = db
	}
	defer func(DbPool *pgx.Conn) {
		_ = DbPool.Close()
	}(dbPool)

	ctx, cancel := context.WithDeadline(ctx, time.Now().Add(time.Second*15))
	defer cancel()

	// insert the device into the database
	if _, err := dbPool.QueryEx(ctx, "SELECT delete_device($1)", nil, req.GetValue()); err != nil {
		return nil, status.Errorf(codes.Internal, "Failed to unregister device: %v", err)
	}

	return &emptypb.Empty{}, nil
}

func (n *NotificationServiceImpl) SendNotification(ctx context.Context, req *pb.NotificationRequest) (*emptypb.Empty, error) {
	for _, deviceToken := range req.GetTokens() {
		if err := verifyDeviceToken(ctx, deviceToken); err == nil {
			// send notification to the device
			if err = sendNotificationToDevice(deviceToken, req.GetTitle(), req.GetBody()); err != nil {
				fmt.Printf("Failed to send notification to device %s: %v", deviceToken, err)
			}
		}
	}

	return &emptypb.Empty{}, nil
}

func (n *NotificationServiceImpl) GetNotifications(deviceId *wrapperspb.StringValue, srv pb.NotificationService_GetNotificationsServer) error {
	// todo: implement this
	return nil
}

// verifyDeviceToken verifies that the device token is valid
func verifyDeviceToken(ctx context.Context, token string) error {
	// open database
	var dbPool *pgx.Conn
	if db, err := config.InitDatabase(); err != nil {
		return status.Errorf(codes.Internal, "The service is unavailable. Try again later: %v", err)
	} else {
		dbPool = db
	}
	defer func(DbPool *pgx.Conn) {
		_ = DbPool.Close()
	}(dbPool)

	ctx, cancel := context.WithDeadline(ctx, time.Now().Add(time.Second*15))
	defer cancel()

	// insert the device into the database
	if _, err := dbPool.QueryEx(ctx, "SELECT device_exists($1)", nil, token); err != nil {
		return status.Errorf(codes.Internal, "Failed to send notification: %v", err)
	}
	return nil
}

// sendNotificationToDevice sends a notification to a device
func sendNotificationToDevice(token, title, body string) error {
	// Create a new notification
	// todo: add support for custom data
	return nil
}
