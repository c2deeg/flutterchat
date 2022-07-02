import 'package:cle_app/widgets/adaptive/adaptive_dialog.dart';
import 'package:cle_app/widgets/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthService {
  static final auth = LocalAuthentication();

  static Future<bool> checkBiometrics(BuildContext context) async {
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException {
      showGeneralError(context);
      return false;
    }
  }

  static Future<List<BiometricType>> getAvailableBiometrics(
      BuildContext context) async {
    try {
      return await auth.getAvailableBiometrics();
    } on PlatformException {
      showGeneralError(context);
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate(BuildContext context) async {
    final hasBiometrics = await checkBiometrics(context);
    if (!hasBiometrics) return false;
    try {
      return await auth.authenticate(
          localizedReason: 'Scan to login!',
          options: const AuthenticationOptions(biometricOnly: true));
    } on PlatformException catch (e) {
      final dialog = AdaptiveDialog(
        context: context,
        title: "Something happened...",
        content: '${e.message}',
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );

      await dialog.showAdaptiveDialog(context);
      return false;
    }
  }

  static Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
  }

  // void showBiometricErrorDialog(BuildContext context) {
  //   final dialog = AdaptiveDialog(
  //     context: context,
  //     androidTitle: androidTitle,
  //     androidContent: androidContent,
  //     iOStitle: iOSTitle,
  //     iOScontent: iOSContent,
  //     actions: [
  //       TextButton(
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //         child: const Text('CANCEL'),
  //       ),
  //       TextButton(
  //         onPressed: () async {},
  //         child: const Text('GO TO SETTINGS'),
  //       ),
  //     ],
  //   );

  //   dialog.showAdaptiveDialog(context);
  // }

  String androidTitle = 'Fingerprint Required';
  String androidContent =
      'Fingerprint authentication is not set up on your device. Go to your Biometric settings to enable Biometric Authenication with us.';
  String iOSTitle = 'FaceId or TouchId Required';
  String iOSContent =
      'FaceId nor TouchId is not set up on your device. Go to your Biometric settings to enable Biometric Authenication with us.';
}
