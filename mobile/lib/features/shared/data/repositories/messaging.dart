import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/features/shared/domain/repositories/messaging.dart';
import 'package:mobile/generated/protos/notification.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

@Injectable(as: BaseMessagingRepository)
class ProcheMessagingRepository extends BaseMessagingRepository {
  final DeviceInfoPlugin deviceInfoPlugin;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final NotificationServiceClient client;
  final BaseLocalStorageRepository storage;
  StreamSubscription? _subscription;

  ProcheMessagingRepository({
    required this.client,
    required this.storage,
    required this.deviceInfoPlugin,
    required this.flutterLocalNotificationsPlugin,
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
  Future<Either<String, String>> getDeviceToken(String userId) async {
    try {
      var request = RegisterDeviceRequest(
        deviceType: await getDeviceType()
            .then((value) => value.fold((l) => l, (r) => '')),
        userId: userId,
      );
      var token = await client.register_device(request);
      return left(token.value);
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
  Future<void> clearToken(String userId) async {
    try {
      await client.unregister_device(StringValue(value: userId));
    } on PlatformException catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> subscribeToNotifications(String userId) async {
    try {
      await _initializeNotificationPlugin();

      _subscription = client
          .get_notifications(StringValue(value: userId))
          .listen((response) async {
        logger.i('notification received: $response');
        // todo -> show local notification
        await flutterLocalNotificationsPlugin.show(
            1, 'Testing', 'Testing with a body', const NotificationDetails(),
            payload: 'Testing');
      }, onError: (e) {
        logger.e(e);
      }, onDone: () {
        logger.i('Done with notification service');
      });
    } on PlatformException catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> unsubscribeFromNotifications() async =>
      await _subscription?.cancel();

  Future<void> _initializeNotificationPlugin() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // todo -> handle local notification
      },
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
      logger.i('notification payload: $payload');
    });
  }
}
