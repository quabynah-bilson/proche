package services

import (
	"context"
	pb "github.com/quabynah-bilson/shared-server/gen"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

type SharedServiceImpl struct {
	pb.UnimplementedSharedServiceServer
}

// NewSharedService create instance of service
func NewSharedService() *SharedServiceImpl {
	return &SharedServiceImpl{}
}

func (i *SharedServiceImpl) CheckForUpdates(_ context.Context, req *wrapperspb.StringValue) (*pb.AppVersion, error) {
	appVersion := "0.0.1" // 0.0.0 is the latest version
	var updateType pb.AppVersion_UpdateType
	if appVersion == req.GetValue() {
		updateType = pb.AppVersion_OPTIONAL
	} else {
		updateType = pb.AppVersion_MANDATORY
	}

	return &pb.AppVersion{
		Version:    appVersion,
		AndroidUrl: "https://play.google.com/store/apps/details?id=com.qcodelabsllc.proche.mobile",
		IosUrl:     "https://itunes.apple.com/us/app/yourapp/id123456789", // TODO: update this
		UpdateType: updateType,
	}, nil
}
