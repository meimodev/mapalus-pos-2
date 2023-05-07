import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Store config card contain circle avatar, name, address, edit button"),
          Text("Account config card contain circle avatar,  name, role, edit button & signout button"),
          Text("Printer config"),
          Text("Branches config"),
          Text("Members config"),
          Text("Crews config"),
        ],
      ),
    );
  }
}
