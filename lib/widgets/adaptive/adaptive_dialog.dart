import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveDialog {
  final BuildContext context;
  final String title;
  final String content;
  final List<Widget> actions;

  const AdaptiveDialog(
      {required this.context,
      this.title = 'Title',
      this.content = 'text',
      required this.actions});

  Future showAdaptiveDialog(BuildContext context) =>
      Platform.isIOS ? showISODialog(context) : showAndroidDialog(context);

  Future showAndroidDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: actions,
          title: Text(title, style: const TextStyle(fontSize: 24)),
          content: Text(content, style: const TextStyle(fontSize: 16)),
        ),
      );

  Future showISODialog(BuildContext context) => showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          actions: actions,
          title: Text(title, style: const TextStyle(fontSize: 24)),
          content: Text(content, style: const TextStyle(fontSize: 16)),
        ),
      );
}
