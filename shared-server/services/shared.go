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

func (i *SharedServiceImpl) CheckForUpdates(context.Context, *wrapperspb.StringValue) (*pb.AppVersion, error) {
	return &pb.AppVersion{
		Version:    "0.0.0", // 0.0.0 is the latest version
		AndroidUrl: "https://play.google.com/store/apps/details?id=com.qcodelabsllc.proche.mobile",
		IosUrl:     "https://itunes.apple.com/us/app/yourapp/id123456789", // TODO: update this
	}, nil
}
