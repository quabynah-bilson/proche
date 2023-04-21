import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/messaging.dart';
import 'package:shared_utils/shared_utils.dart';

@Injectable(as: BaseMessagingRepository)
class FirebaseMessagingRepository extends BaseMessagingRepository {
  final FirebaseMessaging messaging;
  final DeviceInfoPlugin deviceInfoPlugin;

  FirebaseMessagingRepository({
    required this.messaging,
    required this.deviceInfoPlugin,
  });

  @override
  Future<Either<String, String>> getDeviceId() async {
    try {
      if (Platform.isAndroid) {
        var deviceInfo = await deviceInfoPlugin.androidInfo;
        return left(deviceInfo.id);
      }

      if (Platform.isIOS) {
        var deviceInfo = await deviceInfoPlugin.iosInfo;
        return left(deviceInfo.identifierForVendor ?? 'Unknown');
      }

      return right('Unknown');
    } on PlatformException catch (e) {
      logger.e(e);
      return right(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getDeviceToken() async {
    try {
      var token = await messaging.getToken();
      return token.isNullOrEmpty()
          ? right('Failed to generate token')
          : left(token!);
    } on PlatformException catch (e) {
      logger.e(e);
      return right(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getDeviceType() async {
    try {
      if (Platform.isAndroid) {
        var deviceInfo = await deviceInfoPlugin.androidInfo;
        return left(deviceInfo.type);
      }

      if (Platform.isIOS) {
        var deviceInfo = await deviceInfoPlugin.iosInfo;
        return left(deviceInfo.model ?? 'Unknown');
      }

      return right('Unknown');
    } on PlatformException catch (e) {
      logger.e(e);
      return right(e.toString());
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await messaging.deleteToken();
    } on PlatformException catch (e) {
      logger.e(e);
    }
  }
}
