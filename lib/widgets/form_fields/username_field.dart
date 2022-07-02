import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/form_fields/form_utils/form_utils.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final String label;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final void Function(String?) onSaved;
  final bool showIcon;
  const UsernameField(
      {Key? key,
      this.label = 'Username',
      this.textInputAction = TextInputAction.next,
      required this.controller,
      required this.onSaved,
      this.showIcon = true})
      : super(key: key);

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
          fillColor: Colors.black,
          prefixIcon: showIcon ? const Icon(Icons.person) : null,
          border: OutlineInputBorder(
            borderRadius: Constants.radius,
          ),
        ),
        keyboardType: TextInputType.text,
        enableInteractiveSelection: true,
        enabled: true,
        textInputAction: textInputAction,
        validator: (input) {
          if (controller.text.isEmpty) return FormUtil.usernameEmpty;
          if (controller.text.length < 8) return FormUtil.usernameShort;
          return null;
        },
        onSaved: (value) {
          onSaved(value);
        },
      ),
    );
  }
}
