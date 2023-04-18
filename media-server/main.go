package main

import (
	"github.com/cloudinary/cloudinary-go/v2"
	"github.com/joho/godotenv"
	pb "github.com/quabynah-bilson/media-server/gen"
	svc "github.com/quabynah-bilson/media-server/services"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"log"
	"net"
	"os"
)

func main() {
	// This line loads the environment variables from the ".env" file.
	if err := godotenv.Load(); err != nil {
		log.Fatalf("unable to load environment variables: %+v\n", err)
	}

	// create a new grpc server
	s := grpc.NewServer()

	// register reflection service on gRPC server.
	reflection.Register(s)

	// create cloudinary instance
	var cld *cloudinary.Cloudinary
	if cldInstance, err := cloudinary.NewFromParams(os.Getenv("CLOUDINARY_CLOUD_NAME"), os.Getenv("CLOUDINARY_API_KEY"), os.Getenv("CLOUDINARY_API_SECRET")); err != nil {
		log.Fatalf("unable to create cloudinary instance: %+v\n", err)
	} else {
		log.Println("created cloudinary instance")
		cld = cldInstance
	}

	// register the server
	pb.RegisterMediaServiceServer(s, svc.NewProcheMediaServerInstance(cld))

	// run server
	if lis, err := net.Listen("tcp", "0.0.0.0:1700"); err == nil {
		log.Printf("started media grpc server on: %+v\n", lis.Addr())
		if err := s.Serve(lis); err != nil {
			log.Fatalf("unable to start grpc server: %+v\n", err)
		}
	}
}
