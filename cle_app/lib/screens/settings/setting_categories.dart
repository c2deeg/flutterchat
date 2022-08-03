import 'package:flutter/material.dart';

final List<SettingCategory> settingCategories = [
  SettingCategory(
    'Personal Information',
    const Icon(Icons.manage_accounts),
    'Name, Number, Address, Contact Information',
  ),
  SettingCategory(
    'Notifications',
    const Icon(Icons.edit_notifications),
    'Chat Notifications, New Avaliable, Gloabal Notifications Settings',
  ),
  SettingCategory(
    'Password & Security',
    const Icon(Icons.key),
    'Change Password, Biometric Authentication',
  ),
  SettingCategory(
    'Help & Legal',
    const Icon(Icons.help),
    'App information, legal specifications',
  ),
];

class SettingCategory {
  final String name;
  final Icon icon;
  final String desc;

  SettingCategory(this.name, this.icon, this.desc);
}
