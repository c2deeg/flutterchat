import 'package:cle_app/screens/settings/settings.dart';
import 'package:cle_app/services/authentication.dart';
import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final modelController = TextEditingController(text: 'John Smith');
  final mobileNumberController = TextEditingController(text: '123-456-7890');
  final emailController =
      TextEditingController(text: 'jsmith@clelogistics.com');
  final experienceController = TextEditingController(text: '5-6 Years');
  DateTime selectedDate = DateTime(2024, 6, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Account'),
        ),
        actions: [
          IconButton(
            onPressed: () async {
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
                          onTap: () {},
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
