package utils

import (
	"math/rand"
	"time"
)

// GenerateRandomString generates a random string of length n
func GenerateRandomString(n int) string {
	var letters = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")

	// Seed the random number generator
	rand.Seed(time.Now().UnixNano())

	// Create a byte slice of length n
	b := make([]rune, n)

	// Fill the byte slice with random characters
	for i := range b {
		b[i] = letters[rand.Intn(len(letters))]
	}

	// Convert the byte slice to a string and return it
	return string(b)
}
