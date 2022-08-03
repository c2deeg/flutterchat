import 'package:cle_app/providers/settings_provider.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/spacers/vertical_spacer.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPassswordController =
      TextEditingController();
  final changePasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = context.watch<SettingsProvider>();
    bool activeKeyBoard =
        MediaQuery.of(context).viewInsets.bottom > 0 ? true : false;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Change Password'),
        ),
      ),
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
        child: Padding(
          padding: Constants.hPaddingL,
          child: Form(
              key: changePasswordKey,
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: const [
                      Text(
                        'To change your password, please fill out the following.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const VerticalSpacer(),
                  PasswordField(
                    showIcon: false,
                    label: 'Old Password',
                    controller: oldPasswordController,
                  ),
                  PasswordField(
                    showIcon: false,
                    label: 'New Password',
                    controller: newPasswordController,
                  ),
                  PasswordField(
                    showIcon: false,
                    label: 'Confirm New Password',
                    controller: confirmPassswordController,
                  ),
                  const VerticalSpacer(
                    height: 4,
                  ),
                  RRectButton(
                    size: ButtonSize.small,
                    text: "Change Password",
                    loading: settings.isloading,
                    onPressed: () {
                      if (changePasswordKey.currentState!.validate()) {
                        settings.changePassword(
                            context,
                            oldPasswordController.text,
                            newPasswordController.text,
                            confirmPassswordController.text);
                      }
                    },
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
