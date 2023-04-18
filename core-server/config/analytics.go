package config

import (
	"github.com/getsentry/sentry-go"
	"log"
	"os"
)

// InitCrashLogs initializes the crash logs for the application using Sentry
func InitCrashLogs() {
	if err := sentry.Init(sentry.ClientOptions{
		Dsn: os.Getenv("SENTRY_DSN"),
		// Set TracesSampleRate to 1.0 to capture 100%
		// of transactions for performance monitoring.
		// We recommend adjusting this value in production,
		TracesSampleRate: 1.0,
	}); err != nil {
		log.Fatalf("sentry.Init: %s", err)
	}
}
