import 'package:cle_app/widgets/cards/base_card.dart';
import 'package:flutter/material.dart';

class ExpandableCard extends StatelessWidget {
  final bool? semanticContainer;
  final bool? borderOnForeground;
  final double? elevation;
  final Color? shadowColor;
  final Color? headerColor;
  final Color? childColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? childPadding;
  final Clip? clipBehavior;
  final ShapeBorder? shape;
  final Widget? title;
  final Widget? child;
  const ExpandableCard({
    Key? key,
    this.semanticContainer,
    this.borderOnForeground,
    this.elevation,
    this.headerColor,
    this.childColor,
    this.shadowColor,
    this.margin,
    this.childPadding,
    this.clipBehavior,
    this.shape,
    this.title,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      shape: shape,
      clipBehavior: clipBehavior,
      color: headerColor,
      semanticContainer: semanticContainer,
      borderOnForeground: borderOnForeground,
      shadowColor: shadowColor,
      elevation: elevation,
      childPadding: const EdgeInsets.all(0),
      margin: margin,
      child: ExpansionTile(
        title: Container(
            alignment: Alignment.centerLeft,
            child: title ?? const Text('Text')),
        children: [
          BaseCard(
            child: child,
            semanticContainer: semanticContainer,
            borderOnForeground: borderOnForeground,
            margin: const EdgeInsets.all(0),
            childPadding: childPadding,
            color: childColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
          )
        ],
      ),
    );
  }
}
