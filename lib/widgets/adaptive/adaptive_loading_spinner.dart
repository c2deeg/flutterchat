import 'package:flutter/material.dart';

class AdaptiveLoadingSpinner extends StatelessWidget {
  const AdaptiveLoadingSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
