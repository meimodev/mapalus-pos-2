import 'package:flutter/material.dart';

class SettingMemberScreen extends StatelessWidget {
  const SettingMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Setting member"),
          ],
        ),
      ),
    );
  }
}
