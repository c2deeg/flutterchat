import 'package:badges/badges.dart';
import 'package:cle_app/screens/home/app_drawer.dart';
import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int notificationCount = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Notifications'),
          ),
          actions: [
            IconButton(
              onPressed: () {
                AppRouter.rootNavigator.currentState
                    ?.pushNamed(Routes.accountPage);
              },
              icon: const Icon(FontAwesomeIcons.solidUser),
            ),
          ],
        ),
        drawer: const AppDrawer(currentIndex: 6),
        body: notificationCount < 1
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        FontAwesomeIcons.listCheck,
                        color: Colors.grey,
                        size: 70,
                      ),
                      Text(
                        "Nothing to see here",
                        style: TextStyle(color: Colors.grey, fontSize: 30),
                      )
                    ]),
              )
            : ListView.builder(
                itemCount: notificationCount,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Dismissible(
                        onDismissed: (dircrection) {
                          setState(() {
                            notificationCount--;
                          });
                        },
                        key: UniqueKey(),
                        child: const Card(
                            child: ListTile(
                          title: Text("Notification Title"),
                          subtitle: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                        )),
                      ),
                    )));
  }
}
