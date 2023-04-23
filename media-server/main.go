package main

import (
	"github.com/joho/godotenv"
	"github.com/quabynah-bilson/media-server/config"
	pb "github.com/quabynah-bilson/media-server/gen"
	svc "github.com/quabynah-bilson/media-server/services"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"log"
	"net"
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
	cld := config.InitCloudinary()

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
