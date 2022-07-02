import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/form_fields/form_utils/form_utils.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool multiLine;
  final void Function(String?) onSaved;
  const AppTextField({
    Key? key,
    this.label = 'Text',
    this.textInputAction = TextInputAction.next,
    required this.controller,
    required this.onSaved,
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
          contentPadding: Constants.hPaddingM,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: Constants.radius,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        enableInteractiveSelection: true,
        enabled: true,
        textInputAction: textInputAction,
        validator: (input) {
          if (controller.text.isEmpty) return FormUtil.emailEmpty;
          if (EmailValidator.validate(controller.text)) {
            return FormUtil.emailValid;
          }
          return null;
        },
        onSaved: (value) {
          onSaved(value);
        },
      ),
    );
  }
}
