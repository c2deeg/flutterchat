import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/buttons/button_helper.dart';
import 'package:cle_app/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';

class RRectButton extends StatelessWidget {
  final bool loading, fullwidth;
  final String text;
  final VoidCallback onPressed;
  final ButtonSize size;
  final Color? buttonColor, textColor;
  final BorderRadius? radius;
  const RRectButton({
    Key? key,
    this.loading = false,
    this.fullwidth = true,
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.small,
    this.buttonColor,
    this.textColor,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = getButtonFontSize(size);
    final spinnerSize = getSpinnerSize(size);
    final spinnerPadding = getSpinnerPadding(size);

    return SizedBox(
      width: fullwidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        child: loading
            ? Padding(
                padding: spinnerPadding,
                child: LoadingSpinner(
                  size: fontSize,
                  lineWidth: spinnerSize,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                    color: textColor ?? Palette.white,
                    fontSize: fontSize,
                    letterSpacing: 1.25),
              ),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: radius ?? Constants.radiusM),
          padding: Constants.padding,
          primary: buttonColor,
        ),
      ),
    );
  }
}
