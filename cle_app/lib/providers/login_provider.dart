import 'package:cle_app/services/authentication.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isloading => _isLoading;

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  Future<bool> login(
      String username, String password, BuildContext context) async {
    setLoading(true);
    final authenticatedUser = await AuthenticationService()
        .signInWithUsernamePassword(username.trim(), password.trim(), context);
    if (authenticatedUser == null) {
      setLoading(false);
      return false;
    }
    setLoading(false);
    return true;
  }
}
