// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.15.8
// source: auth.proto

package core

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	wrapperspb "google.golang.org/protobuf/types/known/wrapperspb"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// AuthServiceClient is the client API for AuthService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type AuthServiceClient interface {
	// auth
	Login(ctx context.Context, in *LoginRequest, opts ...grpc.CallOption) (*wrapperspb.StringValue, error)
	Register(ctx context.Context, in *RegisterRequest, opts ...grpc.CallOption) (*wrapperspb.StringValue, error)
	ResetPassword(ctx context.Context, in *ResetPasswordRequest, opts ...grpc.CallOption) (*wrapperspb.StringValue, error)
	Logout(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error)
	VerifyPassword(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error)
	// request public access token for unauthenticated calls
	RequestPublicAccessToken(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.StringValue, error)
	// validate access token from microservices for authorization (only for internal calls)
	ValidateAccessToken(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*ValidateAccessTokenResponse, error)
	// account
	GetAccount(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*Account, error)
	GetAccountByPhoneNumber(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*Account, error)
	GetAccountById(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*Account, error)
	UpdateAccount(ctx context.Context, in *Account, opts ...grpc.CallOption) (*Account, error)
	DeleteAccount(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error)
	// business account
	GetBusinessAccount(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*BusinessAccount, error)
	UpdateBusinessAccount(ctx context.Context, in *BusinessAccount, opts ...grpc.CallOption) (*BusinessAccount, error)
	DeleteBusinessAccount(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error)
	CreateBusinessAccount(ctx context.Context, in *CreateBusinessAccountRequest, opts ...grpc.CallOption) (*BusinessAccount, error)
	// referral code
	GetReferralCode(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.StringValue, error)
	GetReferralCodeByPhoneNumber(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*wrapperspb.StringValue, error)
	// country
	GetCountries(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*GetCountriesResponse, error)
	GetCountryById(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*Country, error)
	AddCountry(ctx context.Context, in *Country, opts ...grpc.CallOption) (*Country, error)
	DeleteCountry(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error)
}

type authServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewAuthServiceClient(cc grpc.ClientConnInterface) AuthServiceClient {
	return &authServiceClient{cc}
}

func (c *authServiceClient) Login(ctx context.Context, in *LoginRequest, opts ...grpc.CallOption) (*wrapperspb.StringValue, error) {
	out := new(wrapperspb.StringValue)
	err := c.cc.Invoke(ctx, "/auth.AuthService/login", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) Register(ctx context.Context, in *RegisterRequest, opts ...grpc.CallOption) (*wrapperspb.StringValue, error) {
	out := new(wrapperspb.StringValue)
	err := c.cc.Invoke(ctx, "/auth.AuthService/register", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) ResetPassword(ctx context.Context, in *ResetPasswordRequest, opts ...grpc.CallOption) (*wrapperspb.StringValue, error) {
	out := new(wrapperspb.StringValue)
	err := c.cc.Invoke(ctx, "/auth.AuthService/reset_password", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) Logout(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/auth.AuthService/logout", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) VerifyPassword(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/auth.AuthService/verify_password", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) RequestPublicAccessToken(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.StringValue, error) {
	out := new(wrapperspb.StringValue)
	err := c.cc.Invoke(ctx, "/auth.AuthService/request_public_access_token", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) ValidateAccessToken(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*ValidateAccessTokenResponse, error) {
	out := new(ValidateAccessTokenResponse)
	err := c.cc.Invoke(ctx, "/auth.AuthService/validate_access_token", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) GetAccount(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*Account, error) {
	out := new(Account)
	err := c.cc.Invoke(ctx, "/auth.AuthService/get_account", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) GetAccountByPhoneNumber(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*Account, error) {
	out := new(Account)
	err := c.cc.Invoke(ctx, "/auth.AuthService/get_account_by_phone_number", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) GetAccountById(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*Account, error) {
	out := new(Account)
	err := c.cc.Invoke(ctx, "/auth.AuthService/get_account_by_id", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) UpdateAccount(ctx context.Context, in *Account, opts ...grpc.CallOption) (*Account, error) {
	out := new(Account)
	err := c.cc.Invoke(ctx, "/auth.AuthService/update_account", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) DeleteAccount(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/auth.AuthService/delete_account", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) GetBusinessAccount(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*BusinessAccount, error) {
	out := new(BusinessAccount)
	err := c.cc.Invoke(ctx, "/auth.AuthService/get_business_account", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) UpdateBusinessAccount(ctx context.Context, in *BusinessAccount, opts ...grpc.CallOption) (*BusinessAccount, error) {
	out := new(BusinessAccount)
	err := c.cc.Invoke(ctx, "/auth.AuthService/update_business_account", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) DeleteBusinessAccount(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/auth.AuthService/delete_business_account", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) CreateBusinessAccount(ctx context.Context, in *CreateBusinessAccountRequest, opts ...grpc.CallOption) (*BusinessAccount, error) {
	out := new(BusinessAccount)
	err := c.cc.Invoke(ctx, "/auth.AuthService/create_business_account", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) GetReferralCode(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.StringValue, error) {
	out := new(wrapperspb.StringValue)
	err := c.cc.Invoke(ctx, "/auth.AuthService/get_referral_code", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) GetReferralCodeByPhoneNumber(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*wrapperspb.StringValue, error) {
	out := new(wrapperspb.StringValue)
	err := c.cc.Invoke(ctx, "/auth.AuthService/get_referral_code_by_phone_number", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) GetCountries(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*GetCountriesResponse, error) {
	out := new(GetCountriesResponse)
	err := c.cc.Invoke(ctx, "/auth.AuthService/get_countries", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) GetCountryById(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*Country, error) {
	out := new(Country)
	err := c.cc.Invoke(ctx, "/auth.AuthService/get_country_by_id", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) AddCountry(ctx context.Context, in *Country, opts ...grpc.CallOption) (*Country, error) {
	out := new(Country)
	err := c.cc.Invoke(ctx, "/auth.AuthService/add_country", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authServiceClient) DeleteCountry(ctx context.Context, in *wrapperspb.StringValue, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/auth.AuthService/delete_country", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// AuthServiceServer is the server API for AuthService service.
// All implementations must embed UnimplementedAuthServiceServer
// for forward compatibility
type AuthServiceServer interface {
	// auth
	Login(context.Context, *LoginRequest) (*wrapperspb.StringValue, error)
	Register(context.Context, *RegisterRequest) (*wrapperspb.StringValue, error)
	ResetPassword(context.Context, *ResetPasswordRequest) (*wrapperspb.StringValue, error)
	Logout(context.Context, *emptypb.Empty) (*emptypb.Empty, error)
	VerifyPassword(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error)
	// request public access token for unauthenticated calls
	RequestPublicAccessToken(context.Context, *emptypb.Empty) (*wrapperspb.StringValue, error)
	// validate access token from microservices for authorization (only for internal calls)
	ValidateAccessToken(context.Context, *emptypb.Empty) (*ValidateAccessTokenResponse, error)
	// account
	GetAccount(context.Context, *emptypb.Empty) (*Account, error)
	GetAccountByPhoneNumber(context.Context, *wrapperspb.StringValue) (*Account, error)
	GetAccountById(context.Context, *wrapperspb.StringValue) (*Account, error)
	UpdateAccount(context.Context, *Account) (*Account, error)
	DeleteAccount(context.Context, *emptypb.Empty) (*emptypb.Empty, error)
	// business account
	GetBusinessAccount(context.Context, *wrapperspb.StringValue) (*BusinessAccount, error)
	UpdateBusinessAccount(context.Context, *BusinessAccount) (*BusinessAccount, error)
	DeleteBusinessAccount(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error)
	CreateBusinessAccount(context.Context, *CreateBusinessAccountRequest) (*BusinessAccount, error)
	// referral code
	GetReferralCode(context.Context, *emptypb.Empty) (*wrapperspb.StringValue, error)
	GetReferralCodeByPhoneNumber(context.Context, *wrapperspb.StringValue) (*wrapperspb.StringValue, error)
	// country
	GetCountries(context.Context, *emptypb.Empty) (*GetCountriesResponse, error)
	GetCountryById(context.Context, *wrapperspb.StringValue) (*Country, error)
	AddCountry(context.Context, *Country) (*Country, error)
	DeleteCountry(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error)
	mustEmbedUnimplementedAuthServiceServer()
}

// UnimplementedAuthServiceServer must be embedded to have forward compatible implementations.
type UnimplementedAuthServiceServer struct {
}

func (UnimplementedAuthServiceServer) Login(context.Context, *LoginRequest) (*wrapperspb.StringValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Login not implemented")
}
func (UnimplementedAuthServiceServer) Register(context.Context, *RegisterRequest) (*wrapperspb.StringValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Register not implemented")
}
func (UnimplementedAuthServiceServer) ResetPassword(context.Context, *ResetPasswordRequest) (*wrapperspb.StringValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ResetPassword not implemented")
}
func (UnimplementedAuthServiceServer) Logout(context.Context, *emptypb.Empty) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Logout not implemented")
}
func (UnimplementedAuthServiceServer) VerifyPassword(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method VerifyPassword not implemented")
}
func (UnimplementedAuthServiceServer) RequestPublicAccessToken(context.Context, *emptypb.Empty) (*wrapperspb.StringValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method RequestPublicAccessToken not implemented")
}
func (UnimplementedAuthServiceServer) ValidateAccessToken(context.Context, *emptypb.Empty) (*ValidateAccessTokenResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ValidateAccessToken not implemented")
}
func (UnimplementedAuthServiceServer) GetAccount(context.Context, *emptypb.Empty) (*Account, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAccount not implemented")
}
func (UnimplementedAuthServiceServer) GetAccountByPhoneNumber(context.Context, *wrapperspb.StringValue) (*Account, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAccountByPhoneNumber not implemented")
}
func (UnimplementedAuthServiceServer) GetAccountById(context.Context, *wrapperspb.StringValue) (*Account, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAccountById not implemented")
}
func (UnimplementedAuthServiceServer) UpdateAccount(context.Context, *Account) (*Account, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateAccount not implemented")
}
func (UnimplementedAuthServiceServer) DeleteAccount(context.Context, *emptypb.Empty) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteAccount not implemented")
}
func (UnimplementedAuthServiceServer) GetBusinessAccount(context.Context, *wrapperspb.StringValue) (*BusinessAccount, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetBusinessAccount not implemented")
}
func (UnimplementedAuthServiceServer) UpdateBusinessAccount(context.Context, *BusinessAccount) (*BusinessAccount, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateBusinessAccount not implemented")
}
func (UnimplementedAuthServiceServer) DeleteBusinessAccount(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteBusinessAccount not implemented")
}
func (UnimplementedAuthServiceServer) CreateBusinessAccount(context.Context, *CreateBusinessAccountRequest) (*BusinessAccount, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateBusinessAccount not implemented")
}
func (UnimplementedAuthServiceServer) GetReferralCode(context.Context, *emptypb.Empty) (*wrapperspb.StringValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetReferralCode not implemented")
}
func (UnimplementedAuthServiceServer) GetReferralCodeByPhoneNumber(context.Context, *wrapperspb.StringValue) (*wrapperspb.StringValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetReferralCodeByPhoneNumber not implemented")
}
func (UnimplementedAuthServiceServer) GetCountries(context.Context, *emptypb.Empty) (*GetCountriesResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetCountries not implemented")
}
func (UnimplementedAuthServiceServer) GetCountryById(context.Context, *wrapperspb.StringValue) (*Country, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetCountryById not implemented")
}
func (UnimplementedAuthServiceServer) AddCountry(context.Context, *Country) (*Country, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AddCountry not implemented")
}
func (UnimplementedAuthServiceServer) DeleteCountry(context.Context, *wrapperspb.StringValue) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteCountry not implemented")
}
func (UnimplementedAuthServiceServer) mustEmbedUnimplementedAuthServiceServer() {}

// UnsafeAuthServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to AuthServiceServer will
// result in compilation errors.
type UnsafeAuthServiceServer interface {
	mustEmbedUnimplementedAuthServiceServer()
}

func RegisterAuthServiceServer(s grpc.ServiceRegistrar, srv AuthServiceServer) {
	s.RegisterService(&AuthService_ServiceDesc, srv)
}

func _AuthService_Login_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(LoginRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).Login(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/login",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).Login(ctx, req.(*LoginRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_Register_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(RegisterRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).Register(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/register",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).Register(ctx, req.(*RegisterRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_ResetPassword_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ResetPasswordRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).ResetPassword(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/reset_password",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).ResetPassword(ctx, req.(*ResetPasswordRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_Logout_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).Logout(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/logout",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).Logout(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_VerifyPassword_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).VerifyPassword(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/verify_password",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).VerifyPassword(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_RequestPublicAccessToken_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).RequestPublicAccessToken(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/request_public_access_token",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).RequestPublicAccessToken(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_ValidateAccessToken_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).ValidateAccessToken(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/validate_access_token",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).ValidateAccessToken(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_GetAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).GetAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/get_account",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).GetAccount(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_GetAccountByPhoneNumber_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).GetAccountByPhoneNumber(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/get_account_by_phone_number",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).GetAccountByPhoneNumber(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_GetAccountById_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).GetAccountById(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/get_account_by_id",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).GetAccountById(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_UpdateAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Account)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).UpdateAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/update_account",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).UpdateAccount(ctx, req.(*Account))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_DeleteAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).DeleteAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/delete_account",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).DeleteAccount(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_GetBusinessAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).GetBusinessAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/get_business_account",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).GetBusinessAccount(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_UpdateBusinessAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(BusinessAccount)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).UpdateBusinessAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/update_business_account",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).UpdateBusinessAccount(ctx, req.(*BusinessAccount))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_DeleteBusinessAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).DeleteBusinessAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/delete_business_account",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).DeleteBusinessAccount(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_CreateBusinessAccount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateBusinessAccountRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).CreateBusinessAccount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/create_business_account",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).CreateBusinessAccount(ctx, req.(*CreateBusinessAccountRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_GetReferralCode_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).GetReferralCode(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/get_referral_code",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).GetReferralCode(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_GetReferralCodeByPhoneNumber_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).GetReferralCodeByPhoneNumber(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/get_referral_code_by_phone_number",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).GetReferralCodeByPhoneNumber(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_GetCountries_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).GetCountries(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/get_countries",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).GetCountries(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_GetCountryById_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).GetCountryById(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/get_country_by_id",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).GetCountryById(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_AddCountry_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Country)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).AddCountry(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/add_country",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).AddCountry(ctx, req.(*Country))
	}
	return interceptor(ctx, in, info, handler)
}

func _AuthService_DeleteCountry_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(wrapperspb.StringValue)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthServiceServer).DeleteCountry(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/auth.AuthService/delete_country",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthServiceServer).DeleteCountry(ctx, req.(*wrapperspb.StringValue))
	}
	return interceptor(ctx, in, info, handler)
}

// AuthService_ServiceDesc is the grpc.ServiceDesc for AuthService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var AuthService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "auth.AuthService",
	HandlerType: (*AuthServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "login",
			Handler:    _AuthService_Login_Handler,
		},
		{
			MethodName: "register",
			Handler:    _AuthService_Register_Handler,
		},
		{
			MethodName: "reset_password",
			Handler:    _AuthService_ResetPassword_Handler,
		},
		{
			MethodName: "logout",
			Handler:    _AuthService_Logout_Handler,
		},
		{
			MethodName: "verify_password",
			Handler:    _AuthService_VerifyPassword_Handler,
		},
		{
			MethodName: "request_public_access_token",
			Handler:    _AuthService_RequestPublicAccessToken_Handler,
		},
		{
			MethodName: "validate_access_token",
			Handler:    _AuthService_ValidateAccessToken_Handler,
		},
		{
			MethodName: "get_account",
			Handler:    _AuthService_GetAccount_Handler,
		},
		{
			MethodName: "get_account_by_phone_number",
			Handler:    _AuthService_GetAccountByPhoneNumber_Handler,
		},
		{
			MethodName: "get_account_by_id",
			Handler:    _AuthService_GetAccountById_Handler,
		},
		{
			MethodName: "update_account",
			Handler:    _AuthService_UpdateAccount_Handler,
		},
		{
			MethodName: "delete_account",
			Handler:    _AuthService_DeleteAccount_Handler,
		},
		{
			MethodName: "get_business_account",
			Handler:    _AuthService_GetBusinessAccount_Handler,
		},
		{
			MethodName: "update_business_account",
			Handler:    _AuthService_UpdateBusinessAccount_Handler,
		},
		{
			MethodName: "delete_business_account",
			Handler:    _AuthService_DeleteBusinessAccount_Handler,
		},
		{
			MethodName: "create_business_account",
			Handler:    _AuthService_CreateBusinessAccount_Handler,
		},
		{
			MethodName: "get_referral_code",
			Handler:    _AuthService_GetReferralCode_Handler,
		},
		{
			MethodName: "get_referral_code_by_phone_number",
			Handler:    _AuthService_GetReferralCodeByPhoneNumber_Handler,
		},
		{
			MethodName: "get_countries",
			Handler:    _AuthService_GetCountries_Handler,
		},
		{
			MethodName: "get_country_by_id",
			Handler:    _AuthService_GetCountryById_Handler,
		},
		{
			MethodName: "add_country",
			Handler:    _AuthService_AddCountry_Handler,
		},
		{
			MethodName: "delete_country",
			Handler:    _AuthService_DeleteCountry_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "auth.proto",
}
