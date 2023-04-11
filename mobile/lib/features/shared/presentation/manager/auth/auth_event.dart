part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  const SignInEvent({required this.phoneNumber, required this.password});
}