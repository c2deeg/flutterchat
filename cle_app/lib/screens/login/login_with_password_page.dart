import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/providers/login_provider.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import '../../api/Model/get_create_api_model.dart';

class LoginWithPasswordPage extends StatefulWidget {
  const LoginWithPasswordPage({Key? key}) : super(key: key);

  @override
  State<LoginWithPasswordPage> createState() => _LoginWithPasswordPageState();
}

class _LoginWithPasswordPageState extends State<LoginWithPasswordPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  Future<CretaeGetModel> creategetApi(String userId, String username,
      String email, String role, String deviceToken) async {
    final response = await http.post(
      Uri.parse('http://im2.tainosystems.com:7200/api/users/createOrGet'),
      // Uri.parse('http://im2.tainosystems.com:7200/api/users/createOrGet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': userId,
        'username': username,
        'email': email,
        'role': role,
        'deviceToken': deviceToken,
      }),
    );
    developer.log("response----- " + response.statusCode.toString());
    if (response.statusCode == 200) {
      developer.log("body----- " + jsonDecode(response.body).toString());
      if (kDebugMode) {
        print("checkstatuscode" + response.statusCode.toString());
      }
      return CretaeGetModel.fromJson(jsonDecode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Fail"),
      ));
      developer.log("bodyfail----- " + jsonDecode(response.body));
      throw Exception('Failed to create album.');
    }
  }

  String? token = "";

  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    //
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Palette.white,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Assests.blankSplash))),
        child: SafeArea(
          child: Padding(
            padding: Constants.hPaddingL,
            child: Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Constants.insetL),
                  child: SizedBox(
                      height: 100,
                      child: Image.asset(
                        Assests.logo,
                      )),
                ),
                Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      UsernameField(
                        controller: usernameController,
                      ),
                      PasswordField(
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Constants.insetS),
                  child: RRectButton(
                    text: 'Login',
                    loading: loginProvider.isloading,
                    onPressed: () async {
                      final username = usernameController.text;
                      final password = passwordController.text;
                      if (loginKey.currentState!.validate()) {
                        final authorized = await loginProvider.login(
                            username, password, context);
                        if (authorized) {
                          String userid = LocalData().user.id.toString();
                          String username = LocalData().user.username;
                          String email = LocalData().user.email;
                          creategetApi(userid, username, email, "user", token!);

                          FocusScope.of(context).unfocus();
                          showWelcome(LocalData().user.firstname);
                          AppRouter.rootNavigator.currentState
                              ?.pushReplacementNamed(Routes.homePage);
                        }
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ForgotPassword(),
                  ],
                ),
                const Spacer(
                  flex: 8,
                ),
                const PoweredByUs()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
