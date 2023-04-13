part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class LoginAuthEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  const LoginAuthEvent({required this.phoneNumber, required this.password});
}

class LogoutAuthEvent extends AuthEvent {}

class RegisterAuthEvent extends AuthEvent {
  final String phoneNumber;
  final String password;
  final String displayName;
  String? avatar;

  RegisterAuthEvent({
    required this.phoneNumber,
    required this.password,
    required this.displayName,
    this.avatar,
  });
}

class GetAccountByPhoneNumberAuthEvent extends AuthEvent {
  final String phoneNumber;

  GetAccountByPhoneNumberAuthEvent({required this.phoneNumber});
}

class ResetPasswordAuthEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  ResetPasswordAuthEvent({required this.phoneNumber, required this.password});
}

class SendVerificationCodeAuthEvent extends AuthEvent {
  final String phoneNumber;

  SendVerificationCodeAuthEvent({required this.phoneNumber});
}

class VerifyPhoneNumberAuthEvent extends AuthEvent {
  final String phoneNumber;
  final String code;

  VerifyPhoneNumberAuthEvent({required this.phoneNumber, required this.code});
}

class GetPublicAccessTokenAuthEvent extends AuthEvent {}

class GetReferralCodeAuthEvent extends AuthEvent {}

class GetCurrentAccountAuthEvent extends AuthEvent {}

class GetCountriesAuthEvent extends AuthEvent {}