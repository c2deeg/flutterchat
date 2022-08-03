import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/form_fields/form_utils/form_utils.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final String label;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool showIcon;
  const UsernameField(
      {Key? key,
      this.label = 'Username',
      this.textInputAction = TextInputAction.next,
      required this.controller,
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
          enabledBorder: OutlineInputBorder(
              borderRadius: Constants.radius,
              borderSide: const BorderSide(
                color: Colors.black,
              )),
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
          return null;
        },
      ),
    );
  }
}
