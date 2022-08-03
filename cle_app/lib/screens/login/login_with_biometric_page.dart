import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/services/authentication.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginWithBiometricPage extends StatefulWidget {
  const LoginWithBiometricPage({Key? key}) : super(key: key);

  @override
  State<LoginWithBiometricPage> createState() => _LoginWithBiometricPageState();
}

class _LoginWithBiometricPageState extends State<LoginWithBiometricPage> {
  bool isLoading = false;
  final localData = LocalData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: Constants.insetL),
                  child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        Assests.logo,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Constants.insetS),
                  child: RRectButton(
                    loading: isLoading,
                    text: localData.isUserNew
                        ? 'Smart Login'
                        : 'Login as ${localData.user.firstname}',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      bool isAuthenticated = await AuthenticationService()
                          .signInWithBiometric(context);
                      if (isAuthenticated) {
                        setState(() {
                          isLoading = false;
                        });
                        showWelcome(LocalData().user.firstname);
                        AppRouter.rootNavigator.currentState
                            ?.pushReplacementNamed(Routes.homePage);
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Constants.insetS),
                  child: BorderButton(
                    text: 'Login with password',
                    onPressed: () {
                      AppRouter.rootNavigator.currentState
                          ?.pushNamed(Routes.loginWithPassword);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    NotUser(
                      user: 'Erwins',
                    ),
                  ],
                ),
                const Spacer(),
                const PoweredByUs()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
