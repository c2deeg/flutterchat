import 'package:flutter/material.dart';

final List<SettingCategory> settingCategories = [
  SettingCategory(
    'Personal Information',
    const Icon(Icons.manage_accounts),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, mi quis hendrerit faucibus, mas',
  ),
  SettingCategory(
    'Licenses',
    const Icon(Icons.badge),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, mi quis hendrerit faucibus, mas',
  ),
  SettingCategory(
    'Notifications',
    const Icon(Icons.edit_notifications),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, mi quis hendrerit faucibus, mas',
  ),
  SettingCategory(
    'Password & Security',
    const Icon(Icons.key),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, mi quis hendrerit faucibus, mas',
  ),
  SettingCategory(
    'Banking',
    const Icon(Icons.account_balance),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, mi quis hendrerit faucibus, mas',
  ),
  SettingCategory(
    'Appearance',
    const Icon(Icons.image),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, mi quis hendrerit faucibus, mas',
  ),
  SettingCategory(
    'Feedback',
    const Icon(Icons.feedback),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, mi quis hendrerit faucibus, mas',
  ),
  SettingCategory(
    'Help & Legal',
    const Icon(Icons.help),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin cursus, mi quis hendrerit faucibus, mas',
  ),
];

class SettingCategory {
  final String name;
  final Icon icon;
  final String desc;

  SettingCategory(this.name, this.icon, this.desc);
}
