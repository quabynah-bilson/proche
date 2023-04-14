package main

import (
	"fmt"
	"github.com/joho/godotenv"
	"github.com/nicksnyder/go-i18n/v2/i18n"
	"github.com/quabynah-bilson/core-server/config"
	pb "github.com/quabynah-bilson/core-server/gen"
	svc "github.com/quabynah-bilson/core-server/services"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"log"
	"net"
	"os"
)

func main() {
	localizeConfigWelcome := i18n.LocalizeConfig{
		MessageID: "appName", //1
	}
	localizationUsingJson, _ := localizer.Localize(&localizeConfigWelcome) //2
	fmt.Println(localizationUsingJson)

	// This line loads the environment variables from the ".env" file.
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("unable to load environment variables: %+v\n", err)
	}

	// initialize database connection
	if mongoClient, err := config.InitDatabaseConnection(); err != nil {
		log.Fatalf("unable to initialize database connection: %+v\n", err)
	} else {
		log.Printf("initialized database connection with %d sessions in progress\n", mongoClient.NumberSessionsInProgress())

		// setup collections
		databaseName := os.Getenv("DATABASE_NAME")
		db := mongoClient.Database(databaseName)
		eventsCollection := db.Collection(os.Getenv("EVENTS_COLLECTION"))
		tripsCollection := db.Collection(os.Getenv("TRIPS_COLLECTION"))
		tripEventsCollection := db.Collection(os.Getenv("TRIP_EVENTS_COLLECTION"))
		tasksCollection := db.Collection(os.Getenv("TASKS_COLLECTION"))
		taskEventsCollection := db.Collection(os.Getenv("TASK_EVENTS_COLLECTION"))
		giveAwayCollection := db.Collection(os.Getenv("GIVEAWAYS_COLLECTION"))

		// setup grpc server
		s := grpc.NewServer()
		pb.RegisterEventServiceServer(s, svc.NewProcheEventServerInstance(eventsCollection))
		pb.RegisterTripServiceServer(s, svc.NewProcheTripServerInstance(tripsCollection, tripEventsCollection))
		pb.RegisterTaskServiceServer(s, svc.NewProcheTaskServerInstance(tasksCollection, taskEventsCollection))
		pb.RegisterGiveAwayServiceServer(s, svc.NewProcheGiveAwayServer(giveAwayCollection))
		reflection.Register(s)

		// run server
		if lis, err := net.Listen("tcp", ":2000"); err == nil {
			log.Printf("started core grpc server on: %+v\n", lis.Addr())
			if err := s.Serve(lis); err != nil {
				log.Fatalf("unable to start grpc server: %+v\n", err)
			}
		}
	}
}
