import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  final double height;
  const VerticalSpacer({Key? key, this.height = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 8,
    );
  }
}
