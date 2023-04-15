package services

import (
	"context"
	"fmt"
	"github.com/cloudinary/cloudinary-go/v2"
	"github.com/cloudinary/cloudinary-go/v2/api"
	"github.com/cloudinary/cloudinary-go/v2/api/uploader"
	pb "github.com/quabynah-bilson/media-server/gen"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
	"time"
)

type ProcheMediaServer struct {
	pb.UnimplementedMediaServiceServer
	cld *cloudinary.Cloudinary
}

func NewProcheMediaServerInstance(cld *cloudinary.Cloudinary) *ProcheMediaServer {
	return &ProcheMediaServer{
		UnimplementedMediaServiceServer: pb.UnimplementedMediaServiceServer{},
		cld:                             cld,
	}
}

// UploadMedia uploads a media to cloudinary
// done
func (pms *ProcheMediaServer) UploadMedia(ctx context.Context, req *pb.UploadMediaRequest) (*wrapperspb.StringValue, error) {
	// get base 64 string from request
	encodedString := req.GetBase64()

	// format name
	var uploadName string
	if req.GetName() == "" {
		uploadName = fmt.Sprintf("proche-media-%d", time.Now().UnixNano())
	} else {
		uploadName = fmt.Sprintf("%s-%s", req.GetName(), req.GetOwner())
	}

	// upload to cloudinary
	var result *uploader.UploadResult
	if req.GetType() == pb.MediaType_IMAGE {
		if uploadResult, err := pms.cld.Upload.Upload(ctx, encodedString, uploader.UploadParams{PublicID: uploadName}); err != nil {
			return nil, status.Errorf(codes.Internal, "failed to upload media: %v", err)
		} else {
			result = uploadResult
		}
	} else {
		if uploadResult, err := pms.cld.Upload.Upload(ctx, encodedString, uploader.UploadParams{PublicID: uploadName,
			Eager:      "w_300,h_300,c_pad,ac_none|w_160,h_100,c_crop,g_south,ac_none",
			EagerAsync: api.Bool(true),
		}); err != nil {
			return nil, status.Errorf(codes.Internal, "failed to upload media: %v", err)
		} else {
			result = uploadResult
		}
	}

	// Instantiate an object for the asset
	if req.GetType() == pb.MediaType_IMAGE {
		if img, err := pms.cld.Image(uploadName); err == nil {
			// add the transformation
			img.Transformation = "c_fill,h_250,w_250"

			// generate and return the delivery URL
			if url, err := img.String(); err == nil {
				return &wrapperspb.StringValue{Value: url}, nil
			}
		}
	}

	return &wrapperspb.StringValue{Value: result.SecureURL}, nil
}

// GetMedia gets a media from cloudinary
func (pms *ProcheMediaServer) GetMedia(context.Context, *wrapperspb.StringValue) (*wrapperspb.StringValue, error) {
	return nil, nil
}

// DeleteMedia deletes a media from cloudinary
func (pms *ProcheMediaServer) DeleteMedia(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, nil
}
