import 'package:cle_app/util/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  final double? lineWidth, size;
  final Color? color;
  final Duration? duration;
  const LoadingSpinner(
      {Key? key, this.lineWidth, this.size, this.color, this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitDualRing(
      duration: duration ?? const Duration(milliseconds: 1600),
      lineWidth: lineWidth ?? 4,
      color: color ?? Palette.red,
      size: size ?? 50.0,
    );
  }
}
