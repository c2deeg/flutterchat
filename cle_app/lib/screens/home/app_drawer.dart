import 'package:cle_app/screens/home/home.dart';
import 'package:cle_app/screens/home/route_destinations.dart';
import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(-.8, -1),
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(Constants.insetXL, 60,
                          Constants.insetXL, Constants.insetXL),
                      child: Image.asset(
                        Assests.logo,
                        // height: 160,
                      ),
                    ),
                  ),
                ),
              ),
              for (int i = 0; i < routeDestinations.length; i++)
                ListTile(
                  iconColor: i == currentIndex ? Palette.red : null,
                  leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Icon(routeDestinations[i].icon)),
                  title: Text(
                    routeDestinations[i].title,
                    style: TextStyle(
                        color: i == currentIndex ? Palette.red : null),
                  ),
                  // hoverColor: Colors.white70,
                  onTap: () {
                    Navigator.of(context).pop();
                    navigate(i);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

void navigate(int i) {
  switch (i) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      AppRouter.rootNavigator.currentState?.pushNamedAndRemoveUntil(
        Routes.homePage,
        ((route) => false),
        arguments: i,
      );
      break;
    case 5:
      AppRouter.rootNavigator.currentState
          ?.pushNamedAndRemoveUntil(Routes.accountPage, ((route) => false));
      break;
    case 6:
      AppRouter.rootNavigator.currentState?.pushNamedAndRemoveUntil(
          Routes.notificationsPage, ((route) => false));
      break;
    case 7:
      AppRouter.rootNavigator.currentState
          ?.pushNamedAndRemoveUntil(Routes.reportPage, ((route) => false));
      break;
    default:
      AppRouter.rootNavigator.currentState
          ?.pushNamedAndRemoveUntil(Routes.homePage, ((route) => false));
  }
}
