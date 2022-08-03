import 'package:cle_app/data/data.dart';
import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/models/models.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/adaptive/adaptive_dialog.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  Future<bool> isAuthenticated() async {
    final token = await SecureStore.getToken();
    final username = await SecureStore.getUsername();
    final password = await SecureStore.getPassword();

    if (token == null ||
        username == null ||
        password == null ||
        username.isEmpty ||
        password.isEmpty) {
      return false;
    }

    return true;
  }

  Future<User?> currentUser(BuildContext context) async {
    final username = await SecureStore.getUsername();
    final password = await SecureStore.getPassword();
    if (await NetworkService().isConnected()) {
      final newUser =
          await signInWithUsernamePassword(username!, password!, context);
      if (newUser != null) LocalData().user = newUser;
      return LocalData().user;
    } else {
      return LocalData().user;
    }
  }

  Future<bool> isTokenValid() async {
    final token = await SecureStore.getToken();
    late bool isValid;
    if (token == null) return false;
    try {
      final response = ApiUtil.interceptResponce(
          await ApiClient.create().isTokenValid(token),
          responceType: ResponceType.none);
      if (response) {
        isValid = true;
      } else {
        isValid = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
    return isValid;
  }

  Future<String> getToken() async {
    final token = await SecureStore.getToken();
    late bool isValid;
    if (token == null) {
      await refreshToken();
      final newToken = await SecureStore.getToken();
      return newToken!;
    }
    isValid = await isTokenValid();
    if (isValid) {
      return token;
    }
    await refreshToken();
    final refreshedToken = await SecureStore.getToken();
    return refreshedToken!;
  }

  Future<void> refreshToken() async {
    final username = await SecureStore.getUsername();
    final password = await SecureStore.getPassword();
    if (await NetworkService().isConnected()) {
      final userData = await ApiClient.create()
          .login(Login(username: username!, password: password!).toMap());
      final user =
          ApiUtil.interceptResponce(userData, responceType: ResponceType.user);
      final token =
          ApiUtil.interceptResponce(userData, responceType: ResponceType.token);
      if (user != null) {
        saveUserCredentials(user, password, token);
      } else {
        errorToast();
      }
    } else {
      noInternetToast();
    }
  }

  Future<User?> signInWithUsernamePassword(
      String username, String password, BuildContext context) async {
    final loginInfo = Login(username: username, password: password);
    if (await NetworkService().isConnected()) {
      try {
        final userData = await ApiClient.create().login(loginInfo.toMap());
        final user = ApiUtil.interceptResponce(userData,
            responceType: ResponceType.user);
        final token = ApiUtil.interceptResponce(userData,
            responceType: ResponceType.token);

        if (ApiUtil.hasError(user)) {
          if (user.toString().contains('incorrect')) {
            showWrongPassword(context);
            return null;
          }
          showGeneralError(context);
        }
        saveUserCredentials(user, password, token);
        return user;
      } catch (e) {
        showGeneralError(context);
      }
    } else {
      showInternetlError(context);
      return null;
    }
    return null;
  }

  Future<void> saveUserCredentials(User user, String pass, String token) async {
    setKnownUser();
    LocalData().user = user;
    await SecureStore.storeToken(token);
    await SecureStore.storeUsername(user.username);
    await SecureStore.storePassword(pass);
    await SecureStore.storeUserid(user.id.toString());
    await SecureStore.storeuserEmail(user.email);
  }

  Future<bool> signInWithBiometric(BuildContext context) async {
    if (!LocalData().settings.useBioMetric) {
      final isAuthenticated = await BiometricAuthService.authenticate(context)
          .timeout(const Duration(seconds: 60), onTimeout: () {
        BiometricAuthService.cancelAuthentication();
        return false;
      });
      setKnownUser();
      return isAuthenticated;
    }
    final dialog = AdaptiveDialog(
      context: context,
      title: "Biometric login not enabled",
      content:
          'To sign in with your fingerprint or face, enable \'Biometric Login\' in the app settings > security.',
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );

    await dialog.showAdaptiveDialog(context);
    return false;
  }

  void setKnownUser() {
    if (LocalData().isUserNew) LocalData().isUserNew = false;
  }

  void signUp(User user) {
    return;
  }

  Future<void> signOut(BuildContext context) async {
    if (await NetworkService().isConnected()) {
      try {
        if (!(await isTokenValid())) refreshToken();
        final token = await SecureStore.getToken();
        await ApiClient.create().logout(token!);
      } catch (e) {
        showGeneralError(context);
      }
    }
    await SecureStore.clearAll();
  }

  Future<bool> changePassword(
      String oldPassword, String newPassword, BuildContext context) async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();

        Map<String, dynamic> newPasswordData = {
          "user": {"username": LocalData().user.username},
          "oldpassword": oldPassword,
          "newpassword": newPassword
        };
        final result =
            await ApiClient.create().changePassword(token, newPasswordData);
        final parsedResult = ApiUtil.interceptResponce(
          result,
        );
        if (kDebugMode) {
          print(parsedResult);
        }
        if (parsedResult.toString().contains(
            'error: Verifiez que l\'ancien mot de passe est correct!')) {
          showWrongPassword(context);
          return false;
        }
        if (parsedResult.toString().contains('error:')) {
          showGeneralError(context);
          return false;
        }
        return true;
      } catch (e) {
        errorToast();
        return false;
      }
      // return true;
    } else {
      noInternetToast();
      return false;
    }
  }

  void sendResetPasswordEmail() {}
  void resetPassword() {}
}
