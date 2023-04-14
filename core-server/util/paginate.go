package util

import "go.mongodb.org/mongo-driver/mongo/options"

// PaginateFilter returns a FindOptions with the skip and limit set
func PaginateFilter(page int, perPage int) *options.FindOptions {
	// If page is 0 or less, set it to 1
	if page <= 0 {
		page = 1
	}

	// If perPage is 0 or less, set it to 10
	if perPage <= 0 {
		perPage = 10
	}

	// Return the FindOptions with the skip and limit set
	return &options.FindOptions{
		Skip:  &[]int64{int64(page*perPage - perPage)}[0],
		Limit: &[]int64{int64(perPage)}[0],
	}
}

// MongoDocToProto => helper generic struct to convert full document to proto
type MongoDocToProto[T any] struct {
	FullDocument  T
	OperationType string
}
