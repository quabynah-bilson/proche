// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.26.0
// 	protoc        v3.15.8
// source: task.proto

package core

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	wrapperspb "google.golang.org/protobuf/types/known/wrapperspb"
	reflect "reflect"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

var File_task_proto protoreflect.FileDescriptor

var file_task_proto_rawDesc = []byte{
	0x0a, 0x0a, 0x74, 0x61, 0x73, 0x6b, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x04, 0x74, 0x61,
	0x73, 0x6b, 0x1a, 0x1e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x62, 0x75, 0x66, 0x2f, 0x77, 0x72, 0x61, 0x70, 0x70, 0x65, 0x72, 0x73, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x1a, 0x1b, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x62, 0x75, 0x66, 0x2f, 0x65, 0x6d, 0x70, 0x74, 0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a,
	0x11, 0x63, 0x6f, 0x72, 0x65, 0x5f, 0x73, 0x68, 0x61, 0x72, 0x65, 0x64, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x32, 0xb7, 0x0b, 0x0a, 0x0b, 0x54, 0x61, 0x73, 0x6b, 0x53, 0x65, 0x72, 0x76, 0x69,
	0x63, 0x65, 0x12, 0x38, 0x0a, 0x0b, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x5f, 0x74, 0x61, 0x73,
	0x6b, 0x12, 0x17, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x54,
	0x61, 0x73, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x10, 0x2e, 0x63, 0x6f, 0x72,
	0x65, 0x2e, 0x50, 0x72, 0x6f, 0x63, 0x68, 0x65, 0x54, 0x61, 0x73, 0x6b, 0x12, 0x3c, 0x0a, 0x08,
	0x67, 0x65, 0x74, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x12, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c,
	0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e,
	0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x10, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x50, 0x72,
	0x6f, 0x63, 0x68, 0x65, 0x54, 0x61, 0x73, 0x6b, 0x30, 0x01, 0x12, 0x32, 0x0a, 0x09, 0x67, 0x65,
	0x74, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x73, 0x12, 0x13, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x43,
	0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x41, 0x64, 0x64, 0x72, 0x65, 0x73, 0x73, 0x1a, 0x0e, 0x2e, 0x63,
	0x6f, 0x72, 0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b, 0x4c, 0x69, 0x73, 0x74, 0x30, 0x01, 0x12, 0x46,
	0x0a, 0x1a, 0x67, 0x65, 0x74, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x73, 0x5f, 0x66, 0x6f, 0x72, 0x5f,
	0x63, 0x75, 0x72, 0x72, 0x65, 0x6e, 0x74, 0x5f, 0x75, 0x73, 0x65, 0x72, 0x12, 0x16, 0x2e, 0x67,
	0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45,
	0x6d, 0x70, 0x74, 0x79, 0x1a, 0x0e, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b,
	0x4c, 0x69, 0x73, 0x74, 0x30, 0x01, 0x12, 0x38, 0x0a, 0x0b, 0x75, 0x70, 0x64, 0x61, 0x74, 0x65,
	0x5f, 0x74, 0x61, 0x73, 0x6b, 0x12, 0x17, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x55, 0x70, 0x64,
	0x61, 0x74, 0x65, 0x54, 0x61, 0x73, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x10,
	0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x50, 0x72, 0x6f, 0x63, 0x68, 0x65, 0x54, 0x61, 0x73, 0x6b,
	0x12, 0x43, 0x0a, 0x0b, 0x64, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x12,
	0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x16, 0x2e,
	0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e,
	0x45, 0x6d, 0x70, 0x74, 0x79, 0x12, 0x42, 0x0a, 0x11, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x5f,
	0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x12, 0x1c, 0x2e, 0x63, 0x6f, 0x72,
	0x65, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x54, 0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e,
	0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x0f, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e,
	0x54, 0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x12, 0x41, 0x0a, 0x0e, 0x67, 0x65, 0x74,
	0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x12, 0x1c, 0x2e, 0x67, 0x6f,
	0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74,
	0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x0f, 0x2e, 0x63, 0x6f, 0x72, 0x65,
	0x2e, 0x54, 0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x30, 0x01, 0x12, 0x46, 0x0a, 0x0f,
	0x67, 0x65, 0x74, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x73, 0x12,
	0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x13, 0x2e,
	0x63, 0x6f, 0x72, 0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x4c, 0x69,
	0x73, 0x74, 0x30, 0x01, 0x12, 0x42, 0x0a, 0x11, 0x63, 0x61, 0x6e, 0x63, 0x65, 0x6c, 0x5f, 0x74,
	0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x12, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69,
	0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x0f, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x54,
	0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x12, 0x46, 0x0a, 0x13, 0x63, 0x6f, 0x6d, 0x70,
	0x6c, 0x65, 0x74, 0x65, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x12,
	0x1e, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x43, 0x6f, 0x6d, 0x70, 0x6c, 0x65, 0x74, 0x65, 0x54,
	0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x0f, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74,
	0x12, 0x4f, 0x0a, 0x18, 0x67, 0x65, 0x74, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65,
	0x6e, 0x74, 0x73, 0x5f, 0x66, 0x6f, 0x72, 0x5f, 0x75, 0x73, 0x65, 0x72, 0x12, 0x1c, 0x2e, 0x67,
	0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53,
	0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x13, 0x2e, 0x63, 0x6f, 0x72,
	0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x4c, 0x69, 0x73, 0x74, 0x30,
	0x01, 0x12, 0x4f, 0x0a, 0x18, 0x67, 0x65, 0x74, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76,
	0x65, 0x6e, 0x74, 0x73, 0x5f, 0x66, 0x6f, 0x72, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x12, 0x1c, 0x2e,
	0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e,
	0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x13, 0x2e, 0x63, 0x6f,
	0x72, 0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x4c, 0x69, 0x73, 0x74,
	0x30, 0x01, 0x12, 0x52, 0x0a, 0x21, 0x67, 0x65, 0x74, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65,
	0x76, 0x65, 0x6e, 0x74, 0x73, 0x5f, 0x66, 0x6f, 0x72, 0x5f, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x61,
	0x6e, 0x64, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x12, 0x16, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x54,
	0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x13, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b, 0x45, 0x76, 0x65, 0x6e, 0x74,
	0x4c, 0x69, 0x73, 0x74, 0x30, 0x01, 0x12, 0x49, 0x0a, 0x11, 0x64, 0x65, 0x6c, 0x65, 0x74, 0x65,
	0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x12, 0x1c, 0x2e, 0x67, 0x6f,
	0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74,
	0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74,
	0x79, 0x12, 0x53, 0x0a, 0x1b, 0x64, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x5f, 0x74, 0x61, 0x73, 0x6b,
	0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x73, 0x5f, 0x66, 0x6f, 0x72, 0x5f, 0x74, 0x61, 0x73, 0x6b,
	0x12, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62,
	0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x16,
	0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66,
	0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x12, 0x53, 0x0a, 0x1b, 0x64, 0x65, 0x6c, 0x65, 0x74, 0x65,
	0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x73, 0x5f, 0x66, 0x6f, 0x72,
	0x5f, 0x75, 0x73, 0x65, 0x72, 0x12, 0x1c, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61,
	0x6c, 0x75, 0x65, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x12, 0x56, 0x0a, 0x24, 0x64,
	0x65, 0x6c, 0x65, 0x74, 0x65, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x5f, 0x65, 0x76, 0x65, 0x6e, 0x74,
	0x73, 0x5f, 0x66, 0x6f, 0x72, 0x5f, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x61, 0x6e, 0x64, 0x5f, 0x74,
	0x61, 0x73, 0x6b, 0x12, 0x16, 0x2e, 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b, 0x45,
	0x76, 0x65, 0x6e, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x16, 0x2e, 0x67, 0x6f,
	0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d,
	0x70, 0x74, 0x79, 0x12, 0x52, 0x0a, 0x17, 0x67, 0x65, 0x74, 0x5f, 0x63, 0x61, 0x6e, 0x64, 0x69,
	0x64, 0x61, 0x74, 0x65, 0x73, 0x5f, 0x66, 0x6f, 0x72, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x12, 0x1c,
	0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66,
	0x2e, 0x53, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x1a, 0x17, 0x2e, 0x63,
	0x6f, 0x72, 0x65, 0x2e, 0x54, 0x61, 0x73, 0x6b, 0x43, 0x61, 0x6e, 0x64, 0x69, 0x64, 0x61, 0x74,
	0x65, 0x4c, 0x69, 0x73, 0x74, 0x30, 0x01, 0x12, 0x43, 0x0a, 0x0e, 0x61, 0x70, 0x70, 0x6c, 0x79,
	0x5f, 0x66, 0x6f, 0x72, 0x5f, 0x74, 0x61, 0x73, 0x6b, 0x12, 0x19, 0x2e, 0x63, 0x6f, 0x72, 0x65,
	0x2e, 0x41, 0x70, 0x70, 0x6c, 0x79, 0x46, 0x6f, 0x72, 0x54, 0x61, 0x73, 0x6b, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x42, 0x28, 0x5a, 0x26,
	0x63, 0x6f, 0x6d, 0x2e, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2f, 0x71, 0x75, 0x61, 0x62, 0x79,
	0x6e, 0x61, 0x68, 0x2d, 0x62, 0x69, 0x6c, 0x73, 0x6f, 0x6e, 0x2f, 0x70, 0x72, 0x6f, 0x63, 0x68,
	0x65, 0x3b, 0x63, 0x6f, 0x72, 0x65, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var file_task_proto_goTypes = []interface{}{
	(*CreateTaskRequest)(nil),        // 0: core.CreateTaskRequest
	(*wrapperspb.StringValue)(nil),   // 1: google.protobuf.StringValue
	(*CommonAddress)(nil),            // 2: core.CommonAddress
	(*emptypb.Empty)(nil),            // 3: google.protobuf.Empty
	(*UpdateTaskRequest)(nil),        // 4: core.UpdateTaskRequest
	(*CreateTaskEventRequest)(nil),   // 5: core.CreateTaskEventRequest
	(*CompleteTaskEventRequest)(nil), // 6: core.CompleteTaskEventRequest
	(*TaskEventRequest)(nil),         // 7: core.TaskEventRequest
	(*ApplyForTaskRequest)(nil),      // 8: core.ApplyForTaskRequest
	(*ProcheTask)(nil),               // 9: core.ProcheTask
	(*TaskList)(nil),                 // 10: core.TaskList
	(*TaskEvent)(nil),                // 11: core.TaskEvent
	(*TaskEventList)(nil),            // 12: core.TaskEventList
	(*TaskCandidateList)(nil),        // 13: core.TaskCandidateList
}
var file_task_proto_depIdxs = []int32{
	0,  // 0: task.TaskService.create_task:input_type -> core.CreateTaskRequest
	1,  // 1: task.TaskService.get_task:input_type -> google.protobuf.StringValue
	2,  // 2: task.TaskService.get_tasks:input_type -> core.CommonAddress
	3,  // 3: task.TaskService.get_tasks_for_current_user:input_type -> google.protobuf.Empty
	4,  // 4: task.TaskService.update_task:input_type -> core.UpdateTaskRequest
	1,  // 5: task.TaskService.delete_task:input_type -> google.protobuf.StringValue
	5,  // 6: task.TaskService.create_task_event:input_type -> core.CreateTaskEventRequest
	1,  // 7: task.TaskService.get_task_event:input_type -> google.protobuf.StringValue
	1,  // 8: task.TaskService.get_task_events:input_type -> google.protobuf.StringValue
	1,  // 9: task.TaskService.cancel_task_event:input_type -> google.protobuf.StringValue
	6,  // 10: task.TaskService.complete_task_event:input_type -> core.CompleteTaskEventRequest
	1,  // 11: task.TaskService.get_task_events_for_user:input_type -> google.protobuf.StringValue
	1,  // 12: task.TaskService.get_task_events_for_task:input_type -> google.protobuf.StringValue
	7,  // 13: task.TaskService.get_task_events_for_user_and_task:input_type -> core.TaskEventRequest
	1,  // 14: task.TaskService.delete_task_event:input_type -> google.protobuf.StringValue
	1,  // 15: task.TaskService.delete_task_events_for_task:input_type -> google.protobuf.StringValue
	1,  // 16: task.TaskService.delete_task_events_for_user:input_type -> google.protobuf.StringValue
	7,  // 17: task.TaskService.delete_task_events_for_user_and_task:input_type -> core.TaskEventRequest
	1,  // 18: task.TaskService.get_candidates_for_task:input_type -> google.protobuf.StringValue
	8,  // 19: task.TaskService.apply_for_task:input_type -> core.ApplyForTaskRequest
	9,  // 20: task.TaskService.create_task:output_type -> core.ProcheTask
	9,  // 21: task.TaskService.get_task:output_type -> core.ProcheTask
	10, // 22: task.TaskService.get_tasks:output_type -> core.TaskList
	10, // 23: task.TaskService.get_tasks_for_current_user:output_type -> core.TaskList
	9,  // 24: task.TaskService.update_task:output_type -> core.ProcheTask
	3,  // 25: task.TaskService.delete_task:output_type -> google.protobuf.Empty
	11, // 26: task.TaskService.create_task_event:output_type -> core.TaskEvent
	11, // 27: task.TaskService.get_task_event:output_type -> core.TaskEvent
	12, // 28: task.TaskService.get_task_events:output_type -> core.TaskEventList
	11, // 29: task.TaskService.cancel_task_event:output_type -> core.TaskEvent
	11, // 30: task.TaskService.complete_task_event:output_type -> core.TaskEvent
	12, // 31: task.TaskService.get_task_events_for_user:output_type -> core.TaskEventList
	12, // 32: task.TaskService.get_task_events_for_task:output_type -> core.TaskEventList
	12, // 33: task.TaskService.get_task_events_for_user_and_task:output_type -> core.TaskEventList
	3,  // 34: task.TaskService.delete_task_event:output_type -> google.protobuf.Empty
	3,  // 35: task.TaskService.delete_task_events_for_task:output_type -> google.protobuf.Empty
	3,  // 36: task.TaskService.delete_task_events_for_user:output_type -> google.protobuf.Empty
	3,  // 37: task.TaskService.delete_task_events_for_user_and_task:output_type -> google.protobuf.Empty
	13, // 38: task.TaskService.get_candidates_for_task:output_type -> core.TaskCandidateList
	3,  // 39: task.TaskService.apply_for_task:output_type -> google.protobuf.Empty
	20, // [20:40] is the sub-list for method output_type
	0,  // [0:20] is the sub-list for method input_type
	0,  // [0:0] is the sub-list for extension type_name
	0,  // [0:0] is the sub-list for extension extendee
	0,  // [0:0] is the sub-list for field type_name
}

func init() { file_task_proto_init() }
func file_task_proto_init() {
	if File_task_proto != nil {
		return
	}
	file_core_shared_proto_init()
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_task_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   0,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_task_proto_goTypes,
		DependencyIndexes: file_task_proto_depIdxs,
	}.Build()
	File_task_proto = out.File
	file_task_proto_rawDesc = nil
	file_task_proto_goTypes = nil
	file_task_proto_depIdxs = nil
}
