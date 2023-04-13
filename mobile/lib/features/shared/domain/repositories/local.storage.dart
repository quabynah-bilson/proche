/// handles local storage of session data
abstract class BaseLocalStorageRepository {
  Future<void> saveAccessToken(String token);

  Future<void> clearAccessToken();

  Future<String> get defaultLocale;

  Future<String?> get accessToken;

  Future<void> setLocale(String locale);
}
