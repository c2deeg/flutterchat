import 'package:cle_app/screens/settings/settings.dart';
import 'package:cle_app/services/authentication.dart';
import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  DateTime selectedDate = DateTime(2024, 6, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Settings'),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseMessaging.instance.deleteToken();
              await AuthenticationService().signOut(context);
              AppRouter.rootNavigator.currentState
                  ?.pushReplacementNamed(Routes.initialPage);
            },
            icon: const FaIcon(
              FontAwesomeIcons.rightFromBracket,
              color: Palette.white,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        var settingCategory = settingCategories[index];
                        return ListTile(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Navigator.pushNamed(
                                    context, Routes.personalSettingsPage);
                                break;
                              case 1:
                                Navigator.pushNamed(
                                    context, Routes.notificationSettingsPage);
                                break;
                              case 2:
                                Navigator.pushNamed(
                                    context, Routes.passwordSettingsPage);
                                break;
                              case 3:
                                Navigator.pushNamed(
                                    context, Routes.legalSettingsPage);
                                break;
                              default:
                            }
                          },
                          horizontalTitleGap: 1,
                          // autofocus: true,
                          selected: false,
                          minVerticalPadding: 16,
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: settingCategory.icon,
                          ),
                          title: Text(settingCategory.name),
                          isThreeLine: true,
                          subtitle: Text(settingCategory.desc),
                          trailing: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        );
                      },
                      separatorBuilder: (context, i) => const Divider(
                        height: 2,
                      ),
                      itemCount: settingCategories.length,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
