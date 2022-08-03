import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final bool? semanticContainer;
  final bool? borderOnForeground;
  final double? elevation;
  final Color? shadowColor;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? childPadding;
  final Clip? clipBehavior;
  final ShapeBorder? shape;
  final Widget? child;
  const BaseCard({
    Key? key,
    this.semanticContainer,
    this.borderOnForeground,
    this.elevation,
    this.shadowColor,
    this.color,
    this.margin,
    this.clipBehavior,
    this.shape,
    this.child,
    this.childPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      semanticContainer: semanticContainer ?? true,
      borderOnForeground: borderOnForeground ?? true,
      elevation: elevation ?? 2,
      shadowColor: shadowColor ?? Colors.black,
      color: color ?? Colors.white,
      clipBehavior: clipBehavior ?? Clip.none,
      shape: shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: double.maxFinite,
        padding: childPadding ?? const EdgeInsets.all(16.0),
        child: child ?? const Text('Text'),
      ),
    );
  }
}
