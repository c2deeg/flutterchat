import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final String label;
  const SignUp({Key? key, this.label = 'Join the Team!'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          AppRouter.rootNavigator.currentState?.pushNamed(Routes.signUpPage);
        },
        child: Text(
          label,
          style: const TextStyle(
            letterSpacing: .9,
            fontSize: 16,
          ),
        ));
  }
}
