package config

import (
	"crypto/tls"
	"github.com/sideshow/apns2"
	"os"
)

var NotificationClient *apns2.Client

func InitNotificationClient() {
	// Create a new certificate from your certificate and private key
	cert := tls.Certificate{
		Certificate: [][]byte{[]byte(os.Getenv("APNS_CERT_FILE"))},
		PrivateKey:  []byte(os.Getenv("APNS_KEY_FILE")),
	}

	// Create a new APNS client with your APNS certificate and private key
	NotificationClient = apns2.NewClient(cert)
}
