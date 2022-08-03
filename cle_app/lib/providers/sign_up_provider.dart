import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  int _currentStep = 0;

  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _userName;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  late TextEditingController _cellphoneNumber;
  late TextEditingController _homephoneNumber;
  late TextEditingController _email;

  bool get isloading => _isLoading;
  int get currentStep => _currentStep;

  TextEditingController get firstName => _firstName;
  TextEditingController get lastName => _lastName;
  TextEditingController get userName => _userName;
  TextEditingController get password => _password;
  TextEditingController get confirmPassword => _confirmPassword;
  TextEditingController get cellphoneNumber => _cellphoneNumber;
  TextEditingController get homephoneNumber => _homephoneNumber;
  TextEditingController get email => _email;

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setCurrentStep(int step) {
    _currentStep = step;
  }

  setFirstname(TextEditingController text) {
    _firstName = text;
  }

  setLastname(TextEditingController text) {
    _lastName = text;
  }

  setUsername(TextEditingController text) {
    _userName = text;
  }

  setPassword(TextEditingController text) {
    _password = text;
  }

  setConfirmPass(TextEditingController text) {
    _confirmPassword = text;
  }

  setCellphone(TextEditingController text) {
    _cellphoneNumber = text;
  }

  setHomephone(TextEditingController text) {
    _homephoneNumber = text;
  }

  setEmail(TextEditingController text) {
    _email = text;
  }

  init() {
    setFirstname(TextEditingController());
    setLastname(TextEditingController());
    setUsername(TextEditingController());
    setPassword(TextEditingController());
    setConfirmPass(TextEditingController());
    setCellphone(TextEditingController());
    setHomephone(TextEditingController());
    setEmail(TextEditingController());
  }

  nextStep(FormState state) {
    if (state.validate()) {
      if (currentStep != 2) {
        setCurrentStep(currentStep + 1);
      } else {
        signUp();
      }
    }
    notifyListeners();
  }

  previousStep() {
    if (currentStep != 0) {
      setCurrentStep(currentStep - 1);
    }
    notifyListeners();
  }

  signUp() {
    setLoading(true);

    setLoading(false);
  }
}
