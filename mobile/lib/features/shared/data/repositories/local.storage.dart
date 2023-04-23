import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/storage.keys.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';

@Injectable(as: BaseLocalStorageRepository)
class ProcheLocalStorageRepository extends BaseLocalStorageRepository {
  final FlutterSecureStorage storage;

  const ProcheLocalStorageRepository(this.storage);

  @override
  Future<void> clearAccessToken() async {
    if (await storage.containsKey(key: kAccessTokenKey)) {
      await storage.delete(key: kAccessTokenKey);
    }
  }

  @override
  Future<String> get defaultLocale async =>
      await storage.read(key: kLocaleKey) ?? 'en';

  @override
  Future<void> setLocale(String locale) async =>
      await storage.write(key: kLocaleKey, value: locale);

  @override
  Future<String?> get accessToken async =>
      await storage.read(key: kAccessTokenKey);

  @override
  Future<void> saveAccessToken(String token) async =>
      await storage.write(key: kAccessTokenKey, value: token);

  @override
  Future<int> get currentThemeMode async =>
      int.tryParse(await storage.read(key: kThemeKey) ?? '0') ?? 0;

  @override
  Future<void> setCurrentThemeMode(int themeMode) async =>
      await storage.write(key: kThemeKey, value: themeMode.toString());
}
