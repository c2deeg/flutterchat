class Routes {
  Routes._();

  //util
  static const String initialPage = '/';
  static const String errorPage = '/404';

  //auth
  static const String welcomePage = '/welcome';
  static const String loginPage = '/login';
  static const String loginWithPassword = '/password-login';
  static const String loginWithBiometric = '/smart-login';
  static const String signUpPage = '/sign-up';
  static const String forgotPassword = '/forgotPassword';

  //core
  static const String settingsPage = '/settings';
  static const String passwordPage = '/change_password';
  static const String licensesPage = '/licenses';
  static const String homePage = '/home';
  static const String notificationsPage = '/notifications';
  static const String feedbackPage = '/feedback';
  static const String chatsPage = '/chat';
  static const String chatRoomPage = '/chat?room-number-here';
  static const String earningsPage = '/earnings';
  static const String accountPage = '/account';

  //settings
  static const String accountSettingsPage = '/settings/account';
  static const String appearenceSettingsPage = '/settings/appearance';
  static const String languageSettingsPage = '/settings/language';
  static const String notificationSettingsPage = '/settings/notifications';

  //application
  static const String applicationPage = '/application';

  //driver
  static const String reportPage = '/report';
  static const String overview = '/driver-overview';
  static const String shipmentDetailsPage = '/job?load-number-here';
  static const String shipmentPage = '/shipments';
  static const String mapPage = '/home/map';
  static const String truckspage = '/trucks';

  // //admin
  // static const String adminDashboardPage = '/admin';
  // //dispatch
  // static const String dispatchPage = '/';
  // static const String dispatcherDashboardPage = '/';
  // //saftey
  // static const String licensePage = '/';

  // static const String trailersPage = '/trailers';
  // static const String myTrucksPage = '/mytrucks';
  // static const String trackingPage = '/tracking';
}
