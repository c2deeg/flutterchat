import 'package:cle_app/providers/settings_provider.dart';
import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordSettingsPage extends StatelessWidget {
  const PasswordSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = context.watch<SettingsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Password and Security'),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: Constants.hPadding,
        child: Column(
          children: [
            ListTile(
              title: const Text('Password'),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.pushNamed(context, Routes.passwordPage);
              },
            ),
            Container(
              margin: Constants.hPaddingM,
              child: Row(
                children: const [
                  Text('Biometrics',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Tooltip(
                    message:
                        "Biometric Authentication allows you to use you phones built in fingerprint reader or FaceId to login into the DriveCLE app. Your biometric data is stored localy on your phone and is never sent to anyone.",
                    child: Icon(Icons.help),
                  )
                ],
              ),
            ),
            SwitchListTile(
                title: Row(
                  children: const [
                    Text('Enable Biometric Authentication'),
                  ],
                ),
                value: settings.chatNotifcations,
                activeColor: Palette.red,
                onChanged: (value) {
                  settings.toggleChat(value);
                }),
          ],
        ),
      )),
    );
  }
}
