import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(Assests.splash))),
      child: const Center(child: LoadingSpinner()),
    );
  }
}
