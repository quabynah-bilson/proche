/// This class is used to store the session data
class UserSession {
  /// The current user access token & locale
  static String? kAccessToken, kLocale;
  static bool kIsLoggedIn = false;
  static double lat = 0.0;
  static double lng = 0.0;
}

class QuickHelpSession {
  static int kTasksPerPage = 10;
  static int kTasksPage = 1;
}
