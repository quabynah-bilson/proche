import 'package:dartz/dartz.dart';

abstract class BaseMessagingRepository {
  Future<Either<String, String>> getDeviceToken();

  Future<Either<String, String>> getDeviceId();

  Future<Either<String, String>> getDeviceType();

  Future<void> clearToken();
}
