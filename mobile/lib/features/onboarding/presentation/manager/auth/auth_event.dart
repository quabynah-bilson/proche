part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class LoginAuthEvent extends AuthEvent {
  final String phoneNumber;
  final String password;
  final String countryId;

  const LoginAuthEvent({
    required this.phoneNumber,
    required this.password,
    required this.countryId,
  });
}

class VerifyPasswordAuthEvent extends AuthEvent {
  final String password;

  VerifyPasswordAuthEvent(this.password);
}

class UpdateAccountAuthEvent extends AuthEvent {
  final Account account;

  UpdateAccountAuthEvent(this.account);
}

class LogoutAuthEvent extends AuthEvent {}

class RegisterAuthEvent extends AuthEvent {
  final String phoneNumber;
  final String password;
  final String displayName;
  final String countryId;
  String? avatar;

  RegisterAuthEvent({
    required this.phoneNumber,
    required this.password,
    required this.displayName,
    required this.countryId,
    this.avatar,
  });
}

class GetAccountByPhoneNumberAuthEvent extends AuthEvent {
  final String phoneNumber;

  GetAccountByPhoneNumberAuthEvent(this.phoneNumber);
}

class GetAccountByIdAuthEvent extends AuthEvent {
  final String id;

  GetAccountByIdAuthEvent(this.id);
}

class ResetPasswordAuthEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  // defines whether the token return from the reset should be saved in the local storage
  final bool isPublic;

  ResetPasswordAuthEvent({
    required this.phoneNumber,
    required this.password,
    required this.isPublic,
  });
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

class GetCountryByIdAuthEvent extends AuthEvent {
  final String id;

  GetCountryByIdAuthEvent(this.id);
}
