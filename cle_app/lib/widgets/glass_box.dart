import 'dart:ui';

import 'package:cle_app/util/config/config.dart';
import 'package:flutter/widgets.dart';

class GlassBox extends StatelessWidget {
  final double borderRadius;
  final Widget child;
  const GlassBox({
    Key? key,
    this.borderRadius = Constants.insetS,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        alignment: Alignment.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Padding(
              padding: Constants.padding,
              child: child,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: Palette.white.withOpacity(1),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Palette.white.withOpacity(0.4),
                      Palette.white.withOpacity(0.1)
                    ])),
          )
        ],
      ),
    );
  }
}
