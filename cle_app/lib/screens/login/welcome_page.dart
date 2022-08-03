import 'dart:async';
import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/util/navigator/navigator.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // final login = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Palette.black,
        body: Stack(
          children: [
            const ImageFadeCarousel(),
            GlassBox(child: Container()),
            loginForm(),
          ],
        ));
  }

  SafeArea loginForm() {
    return SafeArea(
      child: Padding(
        padding: Constants.hPaddingL,
        child: Column(
          children: [
            const Spacer(
              flex: 4,
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: Constants.insetL),
                  child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        Assests.logo,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: Constants.insetS),
              child: RRectButton(
                text: 'Login',
                onPressed: () async {
                  AppRouter.rootNavigator.currentState
                      ?.pushNamed(Routes.loginPage);
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: Constants.insetS),
            //   child: RRectButton(
            //     text: 'Join the team!',
            //     onPressed: () async {
            //       AppRouter.rootNavigator.currentState
            //           ?.pushNamed(Routes.signUpPage);
            //     },
            //   ),
            // ),
            const Spacer(
              flex: 6,
            ),
            const PoweredByUs(
              color: Palette.black,
            )
          ],
        ),
      ),
    );
  }
}

class ImageFadeCarousel extends StatefulWidget {
  const ImageFadeCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageFadeCarousel> createState() => _ImageFadeCarouselState();
}

class _ImageFadeCarouselState extends State<ImageFadeCarousel> {
  late Timer _timer;

  int welcomePageIndex = 0;
  List<String> welcomePageBackgrounds = [
    // Assests.welcomeTruck1,
    Assests.welcomeTruck2,
    Assests.welcomeTruck3,
    Assests.welcomeTruck4,
    Assests.welcomeTruck5,
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) async {
      if (mounted) {
        setState(() {
          if (welcomePageIndex + 1 == welcomePageBackgrounds.length) {
            welcomePageIndex = 0;
          } else {
            welcomePageIndex = welcomePageIndex + 1;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(child: child, opacity: animation);
      },
      child: Container(
        key: ValueKey<int>(welcomePageIndex),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Palette.white,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(welcomePageBackgrounds[welcomePageIndex]))),
      ),
    );
  }
}
