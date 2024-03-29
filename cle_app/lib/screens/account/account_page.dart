import 'package:badges/badges.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/providers/notification_provider.dart';
import 'package:cle_app/screens/account/country_flag_emoji.dart';
import 'package:cle_app/screens/home/app_drawer.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/spacers/vertical_spacer.dart';

import 'package:cle_app/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final user = LocalData().user;
    final flag = countryToEmoji(user.country);
    NotificationProvider notif = context.watch<NotificationProvider>();
    return WillPopScope(
        onWillPop: () async {
          if (Navigator.canPop(context)) {
            return true;
          }
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= const Duration(seconds: 1);

          timeBackPressed = DateTime.now();
          if (isExitWarning) {
            pressExit();
            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },
        child: Scaffold(
          // resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Account'),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(Routes.notificationsPage);
                  AppRouter.rootNavigator.currentState
                      ?.pushReplacementNamed(Routes.notificationsPage);
                },
                icon: notif.notificationCount > 0
                    ? Badge(
                        badgeColor: Colors.green,
                        badgeContent: Text(notif.notificationCount.toString()),
                        child: const Icon(FontAwesomeIcons.solidBell))
                    : const Icon(FontAwesomeIcons.solidBell),
              ),
            ],
          ),
          drawer: const AppDrawer(currentIndex: 5),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-.9, -1),
                end: const Alignment(.8, 1),
                // begin: const Alignment(-.4, -1),
                // end: const Alignment(.4, 1),
                stops: const [.2, .201, .8, .801, 1],
                colors: [
                  Palette.red,
                  Colors.white,
                  Colors.white,
                  Colors.black.withOpacity(.1),
                  Colors.black.withOpacity(.1)
                ],
              ),
            ),
            child: Center(
                child: Column(
              children: [
                const VerticalSpacer(
                  height: 7,
                ),
                Stack(
                  alignment: Alignment(1.2, 1.2),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 3, color: Palette.white)),
                      child: const CircleAvatar(
                        child: FaIcon(
                          FontAwesomeIcons.solidUser,
                          size: 40,
                        ),
                        radius: 40,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 3, color: Palette.white)),
                      child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Palette.red,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: Palette.white,
                                size: 18,
                              ))),
                    ),
                  ],
                ),
                const VerticalSpacer(),
                Text(
                  '${user.firstname} ${user.lastname}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 1),
                ),
                Visibility(
                  visible: user.city != null &&
                      user.city != '' &&
                      user.state != null &&
                      user.state != '',
                  child: Text(
                    '${user.city}, ${user.state}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Visibility(
                  visible: user.country != null,
                  child: Text(
                    '$flag ${user.country}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Divider(
                  thickness: 2,
                  height: 1,
                ),
                ListTile(
                  onTap: () {
                    AppRouter.rootNavigator.currentState
                        ?.pushNamed(Routes.passwordPage);
                  },
                  leading: const FaIcon(FontAwesomeIcons.key),
                  title: const Text('Change Password'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 1,
                ),
                ListTile(
                  onTap: () {
                    AppRouter.rootNavigator.currentState
                        ?.pushNamed(Routes.settingsPage);
                  },
                  leading: const FaIcon(FontAwesomeIcons.gear),
                  title: const Text('Settings'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 1,
                ),
                ListTile(
                  onTap: () async {
                    await FirebaseMessaging.instance.deleteToken();
                    await AuthenticationService().signOut(context);
                    AppRouter.rootNavigator.currentState
                        ?.pushReplacementNamed(Routes.initialPage);
                  },
                  leading: const FaIcon(
                    FontAwesomeIcons.rightFromBracket,
                    color: Palette.red,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Palette.red),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Palette.red,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 1,
                ),
              ],
            )),
          ),
        ));
  }
}
