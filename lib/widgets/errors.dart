import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/adaptive/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showGeneralError(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('Something Went Wrong...'),
    duration: Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    shape: StadiumBorder(),
    backgroundColor: Palette.reddark,
  );

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showWrongPassword(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('Incorrect password or username...'),
    duration: Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    shape: StadiumBorder(),
    backgroundColor: Palette.reddark,
  );

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showInternetlError(BuildContext context) {
  var snackBar = SnackBar(
    content: Row(
      children: const [
        Icon(
          Icons.signal_wifi_off,
          color: Palette.white,
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          'We could not reach CLE Services',
        ),
      ],
    ),
    duration: const Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    shape: const StadiumBorder(),
    backgroundColor: Palette.reddark,
  );

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void errorToast() => Fluttertoast.showToast(
    backgroundColor: Palette.red,
    msg: 'Something Went Wrong...',
    gravity: ToastGravity.SNACKBAR);

void noInternetToast() => Fluttertoast.showToast(
    backgroundColor: Palette.red,
    msg: 'We could not reach CLE Services',
    gravity: ToastGravity.SNACKBAR);

void showWelcome(String name) => Fluttertoast.showToast(
    msg: 'Welcome back, $name', gravity: ToastGravity.TOP);

Future<void> enableLocation(BuildContext context) async {
  final dialog = AdaptiveDialog(
    context: context,
    title: "Location Not Enabled",
    content:
        'To continue using this app, please turn on your location sharing.',
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
}

Future<void> giveLocationPermission(BuildContext context) async {
  final dialog = AdaptiveDialog(
    context: context,
    title: "Location Not Allowed",
    content:
        'To continue using this app, please go to your setting and enable location tracking for this app',
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
}
