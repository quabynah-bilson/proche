/// handles local storage of session data
abstract class BaseLocalStorageRepository {
  const BaseLocalStorageRepository();

  Future<String> get defaultLocale;

  Future<void> setLocale(String locale);
}
