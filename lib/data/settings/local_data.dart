import 'dart:convert';

import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/tables/tables.dart';
import 'package:cle_app/data/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static const String userKey = 'user';
  static const String settingsKey = 'settings';
  static const String newUserKey = 'new';

  static final LocalData _instance = LocalData._initCache();

  factory LocalData() {
    return _instance;
  }

  LocalData._initCache();

  late SharedPreferences _preferences;

  init() async => _preferences = await SharedPreferences.getInstance();

  bool get isUserNew => _getFromDisk(newUserKey) ?? true;
  set isUserNew(bool value) => _saveToDisk(newUserKey, value);

  Settings get settings {
    var settingData = _getFromDisk(settingsKey);
    if (settingData == null) return const Settings();
    return Settings.fromJson(settingData);
  }

  set settings(Settings settings) {
    _saveToDisk(settingsKey, settings.toJson());
  }

  User get user {
    var userData = jsonDecode(_getFromDisk(userKey));
    return Users.fromPref(userData);
  }

  set user(User user) {
    _saveToDisk(userKey, jsonEncode(Users.toPref(user)));
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  Future<void> _saveToDisk<T>(String key, T content) async {
    if (content is String) {
      await _preferences.setString(key, content);
    }
    if (content is bool) {
      await _preferences.setBool(key, content);
    }
    if (content is int) {
      await _preferences.setInt(key, content);
    }
    if (content is double) {
      await _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await _preferences.setStringList(key, content);
    }
  }
}
