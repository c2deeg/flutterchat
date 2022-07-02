import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';

class NotUser extends StatelessWidget {
  final String label;
  final String user;
  const NotUser({Key? key, this.label = 'Not', required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          AppRouter.rootNavigator.currentState
              ?.pushNamed(Routes.loginWithPassword);
        },
        child: Text(
          '$label $user?',
          style: const TextStyle(
            letterSpacing: .9,
            fontSize: 16,
          ),
        ));
  }
}
