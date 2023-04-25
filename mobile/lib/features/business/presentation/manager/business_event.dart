part of 'business_bloc.dart';

abstract class BusinessEvent {
  const BusinessEvent();
}

class GetBusinessEvent extends BusinessEvent {
  final String id;

  const GetBusinessEvent(this.id);
}
class GetCurrentUserBusinessEvent extends BusinessEvent {}

class UpdateBusinessEvent extends BusinessEvent {
  final BusinessAccount account;

  const UpdateBusinessEvent(this.account);
}

class DeleteBusinessEvent extends BusinessEvent {
  final String id;

  const DeleteBusinessEvent(this.id);
}

class RegisterBusinessEvent extends BusinessEvent {
  final String specialization;
  final double hourlyCharge;

  const RegisterBusinessEvent({
    required this.specialization,
    required this.hourlyCharge,
  });
}
