import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Palette.white,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Assests.blankSplash))),
        child: SafeArea(
          child: Padding(
            padding: Constants.hPaddingL,
            child: Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Constants.insetL),
                  child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        Assests.logo,
                      )),
                ),
                Text(
                  'Let\'s reset your password! Enter in your email and we\'ll send you a reset link.',
                  style: AppText.bodyLarge(context),
                ),
                const SizedBox(
                  height: 16,
                ),
                EmailField(controller: emailController, onSaved: (value) {}),
                Padding(
                  padding: const EdgeInsets.only(top: Constants.insetS),
                  child: RRectButton(
                    text: 'Send Recovery Email',
                    fullwidth: false,
                    onPressed: () async {},
                  ),
                ),
                const Spacer(
                  flex: 8,
                ),
                const PoweredByUs()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
