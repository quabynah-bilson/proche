/// handles local storage of session data
abstract class BaseLocalStorageRepository {
  const BaseLocalStorageRepository();

  Future<String> get defaultLocale;

  Future<String?> get accessToken;

  Future<int> get currentThemeMode;

  Future<void> setLocale(String locale);

  Future<void> saveAccessToken(String token);

  Future<void> setCurrentThemeMode(int themeMode);

  Future<void> clearAccessToken();
}
