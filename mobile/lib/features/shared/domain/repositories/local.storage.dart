/// handles local storage of session data
abstract class BaseLocalStorageRepository {
  const BaseLocalStorageRepository();

  Future<String> get defaultLocale;

  Future<String?> get accessToken;

  Future<void> setLocale(String locale);

  Future<void> saveAccessToken(String token);

  Future<void> clearAccessToken();
}
