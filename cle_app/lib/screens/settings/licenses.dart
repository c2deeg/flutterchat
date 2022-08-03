import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DriverLicensesPagePage extends StatefulWidget {
  const DriverLicensesPagePage({Key? key}) : super(key: key);

  @override
  State<DriverLicensesPagePage> createState() => _DriverLicensesPagePageState();
}

class _DriverLicensesPagePageState extends State<DriverLicensesPagePage> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPassswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Licences'),
      ),
      body: ListView(
        children: [
          const Divider(
            thickness: 2,
            height: 1,
          ),
          ListTile(
            onTap: () {
              AppRouter.rootNavigator.currentState
                  ?.pushNamed(Routes.initialPage);
            },
            leading: const FaIcon(
              FontAwesomeIcons.idCard,
            ),
            title: const Text(
              'Driver\'s License',
            ),
            subtitle: const Text(
              'Up to Date',
              style: TextStyle(color: Palette.green),
            ),
            trailing: const Text(
              'View',
            ),
          ),
          const Divider(
            thickness: 2,
            height: 1,
          ),
          const Divider(
            thickness: 2,
            height: 1,
          ),
          ListTile(
            onTap: () {
              AppRouter.rootNavigator.currentState
                  ?.pushNamed(Routes.initialPage);
            },
            leading: const FaIcon(
              FontAwesomeIcons.idCard,
            ),
            title: const Text(
              'CDL',
            ),
            subtitle: const Text(
              'Nees Renewal',
              style: TextStyle(color: Palette.red),
            ),
            trailing: const Text(
              'View',
            ),
          ),
          const Divider(
            thickness: 2,
            height: 1,
          ),
        ],
      ),
    );
  }
}
