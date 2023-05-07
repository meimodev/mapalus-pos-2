import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Row of Shop Name + current account info"),
          Text("Summary of orders"),
          Text("Current revenue"),
        ],
      ),
    );
  }
}
