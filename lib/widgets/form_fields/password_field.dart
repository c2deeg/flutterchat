import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/form_fields/form_fields.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final void Function(String?) onSaved;
  final bool showIcon;
  const PasswordField(
      {Key? key,
      this.label = 'Password',
      this.textInputAction = TextInputAction.done,
      required this.controller,
      required this.onSaved,
      this.showIcon = true})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidePassword = true;

  @override
  void initState() {
    widget.controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.vPadding,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.disabled,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: Constants.hPaddingM,
          labelText: widget.label,
          prefixIcon: widget.showIcon ? const Icon(Icons.lock) : null,
          suffixIcon: widget.controller.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: hidePassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
          border: OutlineInputBorder(
            borderRadius: Constants.radius,
          ),
        ),
        obscureText: hidePassword,
        keyboardType: TextInputType.visiblePassword,
        enableInteractiveSelection: true,
        enabled: true,
        textInputAction: widget.textInputAction,
        validator: (input) {
          if (widget.controller.text.isEmpty) return FormUtil.passwordEmpty;
          return null;
        },
        onSaved: (value) {
          widget.onSaved(value);
        },
      ),
    );
  }
}
