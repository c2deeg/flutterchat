import 'package:flutter/material.dart';

class PersonalSettingsPage extends StatelessWidget {
  const PersonalSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Personal Information'),
        ),
      ),
      body: const Center(
        child: SingleChildScrollView(child: Text('Personal Settings')),
      ),
    );
  }
}
