import 'package:cle_app/providers/settings_provider.dart';
import 'package:cle_app/util/config/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = context.watch<SettingsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Notification Settings'),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: Constants.hPadding,
        child: Column(
          children: [
            SwitchListTile(
                title: const Text('Enable General Notifcations'),
                value: settings.generalNotifcations,
                activeColor: Palette.red,
                onChanged: (value) {
                  settings.toggleGeneral(value);
                }),
            SwitchListTile(
                title: const Text('Enable Chat Notifcations'),
                value: settings.chatNotifcations,
                activeColor: Palette.red,
                onChanged: (value) {
                  settings.toggleChat(value);
                }),
            SwitchListTile(
                title: const Text('Enable Available Job Notifcations'),
                value: settings.jobNotifcations,
                activeColor: Palette.red,
                onChanged: (value) {
                  settings.toggleJob(value);
                }),
          ],
        ),
      )),
    );
  }
}
