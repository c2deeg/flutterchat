import 'package:cle_app/providers/notification_provider.dart';
import 'package:cle_app/screens/home/app_drawer.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/adaptive/adaptive_refresh_indicator.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

DateTime timeBackPressed = DateTime.now();

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    NotificationProvider notify = context.watch<NotificationProvider>();
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
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Notifications'),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  AppRouter.rootNavigator.currentState
                      ?.pushReplacementNamed(Routes.accountPage);
                },
                icon: const Icon(FontAwesomeIcons.solidUser),
              ),
            ],
          ),
          drawer: const AppDrawer(currentIndex: 6),
          body: AdaptiveRefreshIndicator(
            onRefresh: () async {
              await notify.getAllNotification();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (notify.isloading)
                  const Center(
                    child: LoadingSpinner(),
                  ),
                if (!notify.isloading)
                  Expanded(
                    child: notify.notificationsList.isEmpty
                        ? ListView(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      FontAwesomeIcons.listCheck,
                                      color: Colors.grey,
                                      size: 70,
                                    ),
                                    Text(
                                      "Nothing to see here",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 30),
                                    )
                                  ]),
                            ],
                          )
                        : ListView.builder(
                            itemCount: notify.notificationsList.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 4),
                                  child: Dismissible(
                                    onDismissed: (dircrection) {
                                      setState(() {
                                        notify.notificationsList
                                            .removeAt(index);
                                        // notificationCount--;
                                        notify.deleteNotification(index);
                                      });
                                    },
                                    key: UniqueKey(),
                                    child: Card(
                                        // surfaceTintColor: Palette.white,
                                        color: Palette.grey,
                                        child: ListTile(
                                          title: Text(notify
                                              .notificationsList[index].title
                                              .toString()),
                                          subtitle: Text(notify
                                              .notificationsList[index].notes
                                              .toString()),
                                        )),
                                  ),
                                )),
                  )
              ],
            ),
          )),
    );
  }
}
