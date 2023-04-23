import 'package:dartz/dartz.dart';

abstract class BaseMessagingRepository {
  Future<Either<String, String>> getDeviceToken(String userId);

  Future<Either<String, String>> getDeviceId();

  Future<Either<String, String>> getDeviceType();

  Future<void> clearToken(String userId);

  Future<void> subscribeToNotifications(String userId);

  Future<void> unsubscribeFromNotifications();
}
