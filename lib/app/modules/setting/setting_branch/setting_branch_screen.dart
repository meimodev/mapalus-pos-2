import 'package:flutter/material.dart';

class SettingBranchScreen extends StatelessWidget {
  const SettingBranchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Setting Branch"),
          ],
        ),
      ),
    );
  }
}
