import 'package:badges/badges.dart';
import 'package:cle_app/screens/home/app_drawer.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/form_fields/form_fields.dart';
import 'package:cle_app/widgets/pickers/app_image_picker.dart';
import 'package:cle_app/widgets/spacers/vertical_spacer.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController reportNotesController = TextEditingController();
  final TextEditingController reportLocationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Report'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.notificationsPage);
            },
            icon: Badge(
                badgeColor: Colors.green,
                badgeContent: const Text('8'),
                child: const Icon(FontAwesomeIcons.solidBell)),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.accountPage);
            },
            icon: const Icon(FontAwesomeIcons.solidUser),
          ),
        ],
      ),
      drawer: const AppDrawer(currentIndex: 7),
      body: Padding(
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
            Form(
                child: Column(
              children: [
                AppTextField(
                  multiLine: true,
                  label: 'what happened...',
                  controller: reportNotesController,
                  onSaved: (_) {},
                ),
                const Padding(
                  padding: Constants.vPadding,
                  child: Text(
                    'Please Provide any photo evidence',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                AppImagePicker(
                  onSelectedImage: (value) {},
                ),
                const VerticalSpacer(
                  height: 1,
                ),
                RRectButton(
                  fullwidth: false,
                  size: ButtonSize.small,
                  text: "Send Report",
                  onPressed: () {},
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
