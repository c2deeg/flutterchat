import 'package:badges/badges.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/screens/home/home.dart';
import 'package:cle_app/util/navigator/navigator.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent, // transparent status bar
    // ));
    super.initState();
    currentIndex = widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    const int bottomNavigationOverflow = 5;
    final bottomDestinations = routeDestinations.sublist(
      0,
      math.min(routeDestinations.length, bottomNavigationOverflow),
    );
    return Scaffold(
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
            icon: Badge(
                badgeColor: Colors.green,
                badgeContent: const Text('8'),
                child: const Icon(FontAwesomeIcons.solidBell)),
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
    );
  }
}
