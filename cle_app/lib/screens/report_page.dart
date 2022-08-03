import 'dart:io';

import 'package:badges/badges.dart';
import 'package:cle_app/providers/notification_provider.dart';
import 'package:cle_app/screens/home/app_drawer.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/pickers/app_image_picker.dart';
import 'package:cle_app/widgets/spacers/vertical_spacer.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController reportNotesController = TextEditingController();
  final TextEditingController reportLocationController =
      TextEditingController();
  File? evidence;
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    bool activeKeyBoard =
        MediaQuery.of(context).viewInsets.bottom > 0 ? true : false;
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
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Report'),
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
        drawer: const AppDrawer(currentIndex: 7),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-.8, -1),
              end: const Alignment(.8, 1),
              // begin: const Alignment(-.4, -1),
              // end: const Alignment(.4, 1),
              stops: activeKeyBoard
                  ? const [.03, .031, .85, .851, 1]
                  : const [.1, .101, .75, .751, 1],
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
            child: SingleChildScrollView(
              child: Padding(
                padding: Constants.paddingXL,
                child: Column(
                  children: [
                    Column(
                      children: const [
                        Text(
                          "What happened?",
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: .5,
                          ),
                        ),
                        Text(
                          'Please explain what happened below in as much detail as possible, and if possible provide photos to help us better understand how to help. If this is a serious and immediate emergency, call 911 and contact emergency services first!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const VerticalSpacer(
                      height: 4,
                    ),
                    Form(child: Builder(builder: (context) {
                      return Column(
                        children: [
                          AppTextField(
                            multiLine: true,
                            label: 'Details of incident',
                            controller: reportNotesController,
                          ),
                          AppTextField(
                            label: 'Location of incident',
                            controller: reportLocationController,
                          ),
                          const Padding(
                            padding: Constants.vPadding,
                            child: Text(
                              'Please Provide any photo evidence',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          AppImagePicker(
                            onSelectedImage: (value) {
                              evidence = value;
                            },
                          ),
                          const VerticalSpacer(
                            height: 1,
                          ),
                          RRectButton(
                            // fullwidth: false,
                            size: ButtonSize.small,
                            text: "Send Report",
                            onPressed: () {
                              if (Form.of(context)!.validate() &&
                                  evidence != null) {
                              } else {
                                if (evidence == null) {}
                              }
                            },
                          ),
                        ],
                      );
                    }))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
