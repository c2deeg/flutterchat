import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/screens/home/home_page.dart';
import 'package:cle_app/screens/screens.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Future<bool> authGate;

  @override
  void initState() {
    super.initState();
    authGate = initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authGate,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.none:
              return const SplashPage();
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data!) {
                  showWelcome(LocalData().user.firstname);
                  return const HomePage();
                }
                if (LocalData().isUserNew) {
                  return const WelcomePage();
                }
                return const LoginPage();
              }
              return const LoginPage();
          }
        });
  }
}

Future<bool> initialize(BuildContext context) async {
  final auth = AuthenticationService();
  final isAuth = await auth.isAuthenticated();
  if (kDebugMode) {
    print(isAuth);
  }
  if (!isAuth) {
    return false;
  } else {
    await auth.currentUser(context);

    return isAuth;
  }
}
