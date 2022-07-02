import 'package:cle_app/screens/account/account_page.dart';
import 'package:cle_app/screens/home/home_page.dart';
import 'package:cle_app/screens/report_page.dart';
import 'package:cle_app/screens/screens.dart';
import 'package:cle_app/screens/settings/change_password.dart';
import 'package:cle_app/screens/settings/licenses.dart';
import 'package:cle_app/screens/settings/settings_page.dart';
import 'package:cle_app/util/navigator/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static final rootNavigator = GlobalKey<NavigatorState>();
  static final settingsNavigator = GlobalKey<NavigatorState>();

  static Route generateRootRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialPage:
        return getPage(const LandingPage());
      case Routes.welcomePage:
        return getPage(const WelcomePage());
      case Routes.signUpPage:
        return getPage(const SignUpPage());
      case Routes.forgotPassword:
        return getPage(const ForgotPasswordPage());
      case Routes.loginPage:
        return getPage(const LoginPage());
      case Routes.loginWithBiometric:
        return getPage(const LoginWithBiometricPage());
      case Routes.loginWithPassword:
        return getPage(const LoginWithPasswordPage());
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (context) => HomePage(
            pageIndex:
                settings.arguments != null ? settings.arguments as int : 0,
          ),
        );
      case Routes.settingsPage:
        return getPage(const SettingsPage());
      case Routes.notificationsPage:
        return getPage(const NotificationsPage());
      case Routes.reportPage:
        return getPage(const ReportPage());
      case Routes.accountPage:
        return getPage(const AccountPage());
      case Routes.passwordPage:
        return getPage(const ChangePasswordPage());
      case Routes.licensesPage:
        return getPage(const DriverLicensesPagePage());
      default:
        return getPage(const LandingPage());
    }
  }

  static Route generateSettingsRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.accountSettingsPage:
        return getPage(const LandingPage());
      case Routes.languageSettingsPage:
        return getPage(const LandingPage());
      case Routes.appearenceSettingsPage:
        return getPage(const LandingPage());
      case Routes.notificationSettingsPage:
        return getPage(const LandingPage());
      default:
        return getPage(const LandingPage());
    }
  }

  static MaterialPageRoute getPage(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
