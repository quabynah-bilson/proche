package config

import (
	"github.com/cloudinary/cloudinary-go/v2"
	"log"
	"os"
)

func InitCloudinary() *cloudinary.Cloudinary {
	var cld *cloudinary.Cloudinary
	if cldInstance, err := cloudinary.NewFromParams(os.Getenv("CLOUDINARY_CLOUD_NAME"), os.Getenv("CLOUDINARY_API_KEY"), os.Getenv("CLOUDINARY_API_SECRET")); err != nil {
		log.Fatalf("unable to create cloudinary instance: %+v\n", err)
	} else {
		cld = cldInstance
	}
	return cld
}
