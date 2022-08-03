import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/screens/login/login.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (LocalData().settings.useBioMetric) {
      return const LoginWithBiometricPage();
    }
    return const LoginWithPasswordPage();
  }
}
