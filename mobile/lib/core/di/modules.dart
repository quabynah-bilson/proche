import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/storage.keys.dart';

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
