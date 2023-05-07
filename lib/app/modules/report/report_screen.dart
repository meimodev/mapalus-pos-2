import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("dropDown list of branches"),
          Text(
              "widgets of Today financial report summary which is revenue, expense, profit"),
          Text(
              "widgets of Today order report summary which is order received, finished, canceled"),
          Text(
            "List of reports to point for each of their own screen, which is, "
            "Transaction reports -> revenue, expense,"
            "Orders reports -> received, finished, canceled",
          ),
        ],
      ),
    );
  }
}
