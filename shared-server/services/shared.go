package services

import (
	pb "github.com/quabynah-bilson/shared-server/gen"
)

type SharedServiceImpl struct {
	pb.UnimplementedSharedServiceServer
}

// NewSharedService create instance of service
func NewSharedService() *SharedServiceImpl {
	return &SharedServiceImpl{}
}
