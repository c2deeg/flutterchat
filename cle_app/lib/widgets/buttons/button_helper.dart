import 'package:flutter/cupertino.dart';

enum ButtonSize {
  xsmall,
  small,
  medium,
  large,
}

double getButtonFontSize(ButtonSize size) {
  switch (size) {
    case ButtonSize.xsmall:
      return 16;
    case ButtonSize.small:
      return 20;
    case ButtonSize.medium:
      return 26;
    case ButtonSize.large:
      return 32;
    default:
      return 26;
  }
}

double getSpinnerSize(ButtonSize size) {
  switch (size) {
    case ButtonSize.xsmall:
      return 2;
    case ButtonSize.small:
      return 3;
    case ButtonSize.medium:
      return 3;
    case ButtonSize.large:
      return 4;
    default:
      return 3;
  }
}

EdgeInsets getSpinnerPadding(ButtonSize size) {
  switch (size) {
    case ButtonSize.xsmall:
      return const EdgeInsets.all(3.8);
    case ButtonSize.small:
      return const EdgeInsets.all(4.5);
    case ButtonSize.medium:
      return const EdgeInsets.all(5.5);
    case ButtonSize.large:
      return const EdgeInsets.all(7);
    default:
      return const EdgeInsets.all(5.5);
  }
}

// BorderRadius getButtonBorderRadius(ButtonSize size) {
//   switch (size) {
//     case ButtonSize.xsmall:
//       return Constants.radiusM;
//     case ButtonSize.small:
//       return Constants.radiusM;
//     case ButtonSize.medium:
//       return Constants.radiusM;
//     case ButtonSize.large:
//       return Constants.radiusM;
//     default:
//       return Constants.radiusM;
//   }
// }
