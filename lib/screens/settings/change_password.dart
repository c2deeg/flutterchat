import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/spacers/vertical_spacer.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
                  onSaved: (value) {}),
              PasswordField(
                  showIcon: false,
                  label: 'New Password',
                  controller: newPasswordController,
                  onSaved: (value) {}),
              PasswordField(
                  showIcon: false,
                  label: 'Confirm New Password',
                  controller: confirmPassswordController,
                  onSaved: (value) {}),
              const VerticalSpacer(
                height: 4,
              ),
              RRectButton(
                fullwidth: false,
                size: ButtonSize.medium,
                text: "Change Password",
                onPressed: () {},
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
