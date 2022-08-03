import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/form_fields/form_utils/form_utils.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final String label;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool showIcon;
  const EmailField({
    Key? key,
    this.label = 'Email',
    this.textInputAction = TextInputAction.next,
    required this.controller,
    this.showIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.vPadding,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.disabled,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: Constants.hPaddingM,
          labelText: label,
          prefixIcon: showIcon ? const Icon(Icons.email) : null,
          border: OutlineInputBorder(
            borderRadius: Constants.radius,
          ),
          enabledBorder: OutlineInputBorder(
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
      ),
    );
  }
}
