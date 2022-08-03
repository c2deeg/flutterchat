import 'package:cle_app/util/config/config.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final bool multiLine;
  const AppTextField({
    Key? key,
    this.label = 'Text',
    this.textInputType,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    this.multiLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.vPadding,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.disabled,
        controller: controller,
        maxLines: multiLine ? null : 1,
        minLines: multiLine ? 3 : 1,
        decoration: InputDecoration(
          contentPadding: Constants.paddingM,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: Constants.radius,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: Constants.radius,
          ),
        ),
        keyboardType: multiLine
            ? TextInputType.multiline
            : textInputType ?? TextInputType.text,
        enableInteractiveSelection: true,
        enabled: true,
        textInputAction: textInputAction,
        validator: (input) {
          if (controller.text.isEmpty) return 'Field can\'t be empty';
          return null;
        },
      ),
    );
  }
}
