import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/storage.keys.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class PersistentStorageModule {
  @injectable
  FlutterSecureStorage get localStorage => const FlutterSecureStorage();

  @preResolve
  @Named('access_token')
  Future<String> get accessToken async =>
      (await localStorage.read(key: kAccessTokenKey)) ?? '';

  @preResolve
  @Named('locale')
  Future<String> get locale async =>
      (await localStorage.read(key: kLocaleKey)) ?? 'en';
}

@module
abstract class SharedAppModule {
  @preResolve
  @Named('app_version')
  Future<String> get appVersion async =>
      (await PackageInfo.fromPlatform()).version;

  @injectable
  DeviceInfoPlugin get deviceInfo => DeviceInfoPlugin();
}