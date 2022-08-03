import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {
  static const storage = FlutterSecureStorage();

  static const String usernameKey = 'username';
  static const String passwordKey = 'password';
  static const String tokenKey = 'token';
  static const String userid = 'id';
  static const String useremail = 'email';

static Future<String?>getuserEmail()async{
  return await decrypt(useremail);
}
  static Future<String?>getUserid()async{
    return await decrypt(userid);
  }
  static Future<String?> getToken() async {
    return await decrypt(tokenKey);
  }

  static Future<String?> getUsername() async {
    return await decrypt(usernameKey);
  }

  static Future<String?> getPassword() async {
    return await decrypt(passwordKey);
  }

  static Future<void> storeUsername(String username) async {
    return await encrypt(usernameKey, username);
  }

  static Future<void> storePassword(String password) async {
    return await encrypt(passwordKey, password);
  }

  static Future<void> storeToken(String token) async {
    return await encrypt(tokenKey, token);
  }

  static Future<void>storeUserid(String id) async{
    return await encrypt(userid, id);
  }
  static Future<void>storeuserEmail(String email)async{
  return await encrypt(useremail, email);
  }

  static Future<void> encrypt(String key, String value) async {
    return await storage.write(key: key, value: value);
  }

  static Future<String?> decrypt(String key) async {
    return await storage.read(key: key);
  }

  static Future<void> clear(String key) async {
    return await storage.delete(key: key);
  }

  static Future<Map<String, String>> decryptAll() async {
    return await storage.readAll();
  }

  static Future<void> clearAll() async {
    return await storage.deleteAll();
  }
}
