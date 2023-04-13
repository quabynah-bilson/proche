///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'auth.pb.dart';

class AuthServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $1.StringValue>(
      '/auth.AuthService/login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $1.StringValue>(
          '/auth.AuthService/register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$reset_password =
      $grpc.ClientMethod<$0.ResetPasswordRequest, $1.StringValue>(
          '/auth.AuthService/reset_password',
          ($0.ResetPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$2.Empty, $2.Empty>(
      '/auth.AuthService/logout',
      ($2.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$request_public_access_token =
      $grpc.ClientMethod<$2.Empty, $1.StringValue>(
          '/auth.AuthService/request_public_access_token',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$validate_access_token =
      $grpc.ClientMethod<$2.Empty, $0.ValidateAccessTokenResponse>(
          '/auth.AuthService/validate_access_token',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ValidateAccessTokenResponse.fromBuffer(value));
  static final _$get_account = $grpc.ClientMethod<$2.Empty, $0.Account>(
      '/auth.AuthService/get_account',
      ($2.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$get_account_by_phone_number =
      $grpc.ClientMethod<$1.StringValue, $0.Account>(
          '/auth.AuthService/get_account_by_phone_number',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$update_account = $grpc.ClientMethod<$0.Account, $0.Account>(
      '/auth.AuthService/update_account',
      ($0.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$delete_account = $grpc.ClientMethod<$2.Empty, $2.Empty>(
      '/auth.AuthService/delete_account',
      ($2.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$send_phone_verification_code =
      $grpc.ClientMethod<$1.StringValue, $2.Empty>(
          '/auth.AuthService/send_phone_verification_code',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$verify_phone_verification_code =
      $grpc.ClientMethod<$0.VerifyPhoneRequest, $2.Empty>(
          '/auth.AuthService/verify_phone_verification_code',
          ($0.VerifyPhoneRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$get_referral_code =
      $grpc.ClientMethod<$2.Empty, $1.StringValue>(
          '/auth.AuthService/get_referral_code',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$get_referral_code_by_phone_number =
      $grpc.ClientMethod<$1.StringValue, $1.StringValue>(
          '/auth.AuthService/get_referral_code_by_phone_number',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$get_countries =
      $grpc.ClientMethod<$2.Empty, $0.GetCountriesResponse>(
          '/auth.AuthService/get_countries',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetCountriesResponse.fromBuffer(value));
  static final _$get_country_by_id =
      $grpc.ClientMethod<$1.StringValue, $0.Country>(
          '/auth.AuthService/get_country_by_id',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Country.fromBuffer(value));
  static final _$add_country = $grpc.ClientMethod<$0.Country, $0.Country>(
      '/auth.AuthService/add_country',
      ($0.Country value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Country.fromBuffer(value));
  static final _$delete_country = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/auth.AuthService/delete_country',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> register($0.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> reset_password(
      $0.ResetPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reset_password, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> logout($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> request_public_access_token(
      $2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$request_public_access_token, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ValidateAccessTokenResponse> validate_access_token(
      $2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$validate_access_token, request, options: options);
  }

  $grpc.ResponseFuture<$0.Account> get_account($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_account, request, options: options);
  }

  $grpc.ResponseFuture<$0.Account> get_account_by_phone_number(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_account_by_phone_number, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.Account> update_account($0.Account request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_account, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_account($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_account, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> send_phone_verification_code(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$send_phone_verification_code, request,
        options: options);
  }

  $grpc.ResponseFuture<$2.Empty> verify_phone_verification_code(
      $0.VerifyPhoneRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verify_phone_verification_code, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> get_referral_code($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_referral_code, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> get_referral_code_by_phone_number(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_referral_code_by_phone_number, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetCountriesResponse> get_countries($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_countries, request, options: options);
  }

  $grpc.ResponseFuture<$0.Country> get_country_by_id($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_country_by_id, request, options: options);
  }

  $grpc.ResponseFuture<$0.Country> add_country($0.Country request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$add_country, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_country($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_country, request, options: options);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $1.StringValue>(
        'login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $1.StringValue>(
        'register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResetPasswordRequest, $1.StringValue>(
        'reset_password',
        reset_password_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResetPasswordRequest.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $2.Empty>(
        'logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.StringValue>(
        'request_public_access_token',
        request_public_access_token_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.ValidateAccessTokenResponse>(
        'validate_access_token',
        validate_access_token_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.ValidateAccessTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.Account>(
        'get_account',
        get_account_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.Account>(
        'get_account_by_phone_number',
        get_account_by_phone_number_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Account, $0.Account>(
        'update_account',
        update_account_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $2.Empty>(
        'delete_account',
        delete_account_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'send_phone_verification_code',
        send_phone_verification_code_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyPhoneRequest, $2.Empty>(
        'verify_phone_verification_code',
        verify_phone_verification_code_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifyPhoneRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.StringValue>(
        'get_referral_code',
        get_referral_code_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $1.StringValue>(
        'get_referral_code_by_phone_number',
        get_referral_code_by_phone_number_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.GetCountriesResponse>(
        'get_countries',
        get_countries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.GetCountriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.Country>(
        'get_country_by_id',
        get_country_by_id_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.Country value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Country, $0.Country>(
        'add_country',
        add_country_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Country.fromBuffer(value),
        ($0.Country value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_country',
        delete_country_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$1.StringValue> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$1.StringValue> reset_password_Pre($grpc.ServiceCall call,
      $async.Future<$0.ResetPasswordRequest> request) async {
    return reset_password(call, await request);
  }

  $async.Future<$2.Empty> logout_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return logout(call, await request);
  }

  $async.Future<$1.StringValue> request_public_access_token_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return request_public_access_token(call, await request);
  }

  $async.Future<$0.ValidateAccessTokenResponse> validate_access_token_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return validate_access_token(call, await request);
  }

  $async.Future<$0.Account> get_account_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return get_account(call, await request);
  }

  $async.Future<$0.Account> get_account_by_phone_number_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_account_by_phone_number(call, await request);
  }

  $async.Future<$0.Account> update_account_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return update_account(call, await request);
  }

  $async.Future<$2.Empty> delete_account_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return delete_account(call, await request);
  }

  $async.Future<$2.Empty> send_phone_verification_code_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return send_phone_verification_code(call, await request);
  }

  $async.Future<$2.Empty> verify_phone_verification_code_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerifyPhoneRequest> request) async {
    return verify_phone_verification_code(call, await request);
  }

  $async.Future<$1.StringValue> get_referral_code_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return get_referral_code(call, await request);
  }

  $async.Future<$1.StringValue> get_referral_code_by_phone_number_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_referral_code_by_phone_number(call, await request);
  }

  $async.Future<$0.GetCountriesResponse> get_countries_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return get_countries(call, await request);
  }

  $async.Future<$0.Country> get_country_by_id_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_country_by_id(call, await request);
  }

  $async.Future<$0.Country> add_country_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Country> request) async {
    return add_country(call, await request);
  }

  $async.Future<$2.Empty> delete_country_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_country(call, await request);
  }

  $async.Future<$1.StringValue> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$1.StringValue> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$1.StringValue> reset_password(
      $grpc.ServiceCall call, $0.ResetPasswordRequest request);
  $async.Future<$2.Empty> logout($grpc.ServiceCall call, $2.Empty request);
  $async.Future<$1.StringValue> request_public_access_token(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$0.ValidateAccessTokenResponse> validate_access_token(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$0.Account> get_account(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$0.Account> get_account_by_phone_number(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$0.Account> update_account(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$2.Empty> delete_account(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$2.Empty> send_phone_verification_code(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> verify_phone_verification_code(
      $grpc.ServiceCall call, $0.VerifyPhoneRequest request);
  $async.Future<$1.StringValue> get_referral_code(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$1.StringValue> get_referral_code_by_phone_number(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$0.GetCountriesResponse> get_countries(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$0.Country> get_country_by_id(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$0.Country> add_country(
      $grpc.ServiceCall call, $0.Country request);
  $async.Future<$2.Empty> delete_country(
      $grpc.ServiceCall call, $1.StringValue request);
}
