import 'package:flutter/material.dart';

class SettingPrinterScreen extends StatelessWidget {
  const SettingPrinterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Setting Printer"),
          ],
        ),
      ),
    );
  }
}
