package util

import (
	"go.mongodb.org/mongo-driver/mongo/options"
	"google.golang.org/grpc/metadata"
	"strconv"
)

const (
	// PageKey is the key for the page number
	pageKey = "x-page"

	// PerPageKey is the key for the number of items per page
	perPageKey = "x-per-page"
)

// PaginateFilter returns a FindOptions with the skip and limit set
func PaginateFilter(meta metadata.MD) *options.FindOptions {
	// get page from metadata
	page := 1
	if pageStr := meta.Get(pageKey); len(pageStr) > 0 {
		// convert page string to int
		page, _ = strconv.Atoi(pageStr[0])
	}

	// get perPage from metadata
	perPage := 10
	if perPageStr := meta.Get(perPageKey); len(perPageStr) > 0 {
		// convert perPage to int
		perPage, _ = strconv.Atoi(perPageStr[0])
	}

	// Return the FindOptions with the skip and limit set
	skip := int64(page*perPage - perPage) // e.g. page 2, perPage 10 => 10 * 2 - 10 = 10
	limit := int64(perPage)
	return &options.FindOptions{
		Skip:  &skip,
		Limit: &limit,
	}
}

// MongoDocToProto => helper generic struct to convert full document to proto
type MongoDocToProto[T any] struct {
	FullDocument  T
	OperationType string
}
