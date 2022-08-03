import 'package:flutter/material.dart';

class HorizontalSpacer extends StatelessWidget {
  final double width;
  const HorizontalSpacer({Key? key, this.width = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 8,
    );
  }
}
