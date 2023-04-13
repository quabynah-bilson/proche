import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';

@Injectable(as: BaseLocalStorageRepository)
class ProcheLocalStorageRepository extends BaseLocalStorageRepository {
  final FlutterSecureStorage storage;
  final _kAccessTokenKey = 'proche-token-key',
      _kLocaleKey = 'proche-locale-key';

  ProcheLocalStorageRepository(this.storage);

  @override
  Future<void> clearAccessToken() async {
    if (await storage.containsKey(key: _kAccessTokenKey)) {
      await storage.delete(key: _kAccessTokenKey);
    }
  }

  @override
  Future<String> get defaultLocale async =>
      await storage.read(key: _kLocaleKey) ?? 'en';

  @override
  Future<void> setLocale(String locale) async =>
      await storage.write(key: _kLocaleKey, value: locale);

  @override
  Future<String?> get accessToken async =>
      await storage.read(key: _kAccessTokenKey);

  @override
  Future<void> saveAccessToken(String token) async =>
      await storage.write(key: _kAccessTokenKey, value: token);
}
