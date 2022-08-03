import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/errors.dart';
import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _generalNotifcations = true;
  bool _chatNotifcations = true;
  bool _jobNotifcations = true;

  bool get isloading => _isLoading;
  bool get generalNotifcations => _generalNotifcations;
  bool get chatNotifcations => _chatNotifcations;
  bool get jobNotifcations => _jobNotifcations;

  SettingsProvider();

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  toggleGeneral(bool value) {
    _generalNotifcations = value;
    notifyListeners();
  }

  toggleChat(bool value) {
    _chatNotifcations = value;
    notifyListeners();
  }

  toggleJob(bool value) {
    _jobNotifcations = value;
    notifyListeners();
  }

  changePassword(BuildContext context, String oldPassword, String newPassword,
      String confirmPassword) async {
    setLoading(true);
    oldPassword.trim();
    newPassword.trim();
    confirmPassword.trim();
    String? storedPassword = await SecureStore.getPassword();
    if (storedPassword == null || storedPassword == '') {
      errorToast();
      setLoading(false);
      return;
    }
    if (oldPassword != storedPassword) {
      showWrongOldPassword(context);
      setLoading(false);
      return;
    }
    if (newPassword != confirmPassword) {
      showNoMatchingPassword(context);
      setLoading(false);
      return;
    }
    if (await AuthenticationService()
        .changePassword(oldPassword, newPassword, context)) {
      passwordChanged();
      Navigator.pop(context);
    } else {
      errorToast();
    }

    setLoading(false);
  }
}
