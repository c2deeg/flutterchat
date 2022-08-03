import 'package:badges/badges.dart';
import 'package:cle_app/providers/location_provider.dart';
import 'package:cle_app/providers/notification_provider.dart';
import 'package:cle_app/screens/home/home.dart';
import 'package:cle_app/util/navigator/navigator.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final int pageIndex;
  const HomePage({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool expandRail = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ));
    super.initState();
    currentIndex = widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    LocationProvider gps = context.watch<LocationProvider>();
    NotificationProvider notif = context.watch<NotificationProvider>();
    DateTime timeBackPressed = DateTime.now();
    const int bottomNavigationOverflow = 5;
    final bottomDestinations = routeDestinations.sublist(
      0,
      math.min(routeDestinations.length, bottomNavigationOverflow),
    );
    return WillPopScope(
      onWillPop: () async {
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
        body: screens[currentIndex],
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(routeDestinations[currentIndex].title),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.notificationsPage);
              },
              icon: notif.notificationCount > 0
                  ? Badge(
                      badgeColor: Colors.green,
                      badgeContent: Text(notif.notificationCount.toString()),
                      child: const Icon(FontAwesomeIcons.solidBell))
                  : const Icon(FontAwesomeIcons.solidBell),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.accountPage);
              },
              icon: const Icon(FontAwesomeIcons.solidUser),
            ),
          ],
        ),
        drawer: AppDrawer(currentIndex: currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            for (final destination in bottomDestinations)
              BottomNavigationBarItem(
                icon: Icon(destination.icon),
                label: destination.title,
              ),
          ],
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
