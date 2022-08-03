import 'package:cle_app/util/config/config.dart';
import 'package:flutter/cupertino.dart';

class FormUtil {
  FormUtil._();

  static const emailEmpty = 'Email can\'t be empty';
  static const emailValid = 'Not a valid email';

  static const usernameEmpty = 'Username can\'t be empty';
  static const usernameShort =
      'Username is too short. Username must be at 8 characters long';

  static const passwordEmpty = 'Password can\'t be empty';
  static const passwordShort =
      'Password is too short. Password must be at 8 characters long';

  static const wrongEmailPasword = 'email or password is wrong';
  static const wrongUsernamePasword = 'username or password is wrong';

  // ignore: prefer_function_declarations_over_variables
  static final counter = (context,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength}) {
    return Text(
      '$currentLength of $maxLength characters',
      semanticsLabel: 'character count',
      style: TextStyle(color: isFocused ? Palette.red : null),
    );
  };
}
