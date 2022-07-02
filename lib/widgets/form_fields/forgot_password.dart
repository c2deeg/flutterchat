import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          AppRouter.rootNavigator.currentState
              ?.pushNamed(Routes.forgotPassword);
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(letterSpacing: .9, fontSize: 16),
        ));
  }
}
