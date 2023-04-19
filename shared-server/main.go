package main

import (
	"github.com/joho/godotenv"
	pb "github.com/quabynah-bilson/shared-server/gen"
	svc "github.com/quabynah-bilson/shared-server/services"
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

	pb.RegisterSharedServiceServer(s, svc.NewSharedService())

	// run server
	if lis, err := net.Listen("tcp", "0.0.0.0:1900"); err == nil {
		log.Printf("started media grpc server on: %+v\n", lis.Addr())
		if err := s.Serve(lis); err != nil {
			log.Fatalf("unable to start grpc server: %+v\n", err)
		}
	}
}
