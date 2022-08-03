// import 'package:drive_cle/util/Components/base_card.dart';
// import 'package:drive_cle/util/constants.dart';
// import 'package:drive_cle/util/theme.dart';
// import 'package:flutter/material.dart';

// class DualExpandableCard extends StatefulWidget {
//   final bool? semanticContainer;
//   final bool? borderOnForeground;
//   final double? elevation;
//   final Color? shadowColor;
//   final Color? color;
//   final Color? tonalColor;
//   final Color? borderColor;
//   final EdgeInsetsGeometry? margin;
//   final EdgeInsetsGeometry? childPadding;
//   final Clip? clipBehavior;
//   final ShapeBorder? shape;
//   final Widget? title;
//   final Widget? child;
//   const DualExpandableCard({
//     Key? key,
//     this.semanticContainer,
//     this.borderOnForeground,
//     this.elevation,
//     this.color,
//     this.shadowColor,
//     this.tonalColor,
//     this.borderColor,
//     this.margin,
//     this.childPadding,
//     this.clipBehavior,
//     this.shape,
//     this.title,
//     this.child,
//   }) : super(key: key);

//   @override
//   State<DualExpandableCard> createState() => _DualExpandableCardState();
// }

// class _DualExpandableCardState extends State<DualExpandableCard> {
//   bool isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: defaultTheme.copyWith(dividerColor: Colors.transparent),
//       child: BaseCard(
//         shape: widget.shape,
//         clipBehavior: widget.clipBehavior,
//         color: widget.color,
//         semanticContainer: widget.semanticContainer,
//         borderOnForeground: widget.borderOnForeground,
//         shadowColor: widget.shadowColor,
//         elevation: widget.elevation,
//         childPadding: const EdgeInsets.all(0),
//         margin: widget.margin,
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: isSelected
//                     ? (widget.borderColor ?? secondaryColor)
//                     : Colors.transparent,
//                 width: 2,
//               )),
//           child: ExpansionTile(
//             onExpansionChanged: (value) => setState(() {
//               isSelected = value;
//             }),
//             title: Container(
//                 alignment: Alignment.centerLeft,
//                 child: widget.title ?? const Text('Text')),
//             children: [
//               BaseCard(
//                 child: widget.child,
//                 semanticContainer: widget.semanticContainer,
//                 borderOnForeground: widget.borderOnForeground,
//                 margin: const EdgeInsets.all(0),
//                 childPadding: widget.childPadding,
//                 color: widget.tonalColor ?? secondaryColor10,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(10),
//                         bottomRight: Radius.circular(10))),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
