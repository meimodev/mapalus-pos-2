import 'package:flutter/material.dart';

class SettingAccountScreen extends StatelessWidget {
  const SettingAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Setting Account"),
          ],
        ),
      ),
    );
  }
}
