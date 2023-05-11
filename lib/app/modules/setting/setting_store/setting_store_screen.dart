import 'package:flutter/material.dart';

class SettingStoreScreen extends StatelessWidget {
  const SettingStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Setting Store"),
          ],
        ),
      ),
    );
  }
}
