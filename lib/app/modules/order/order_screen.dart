import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Sumamry of orders, including product quantities"),
          Text("payment time status drowdown list "),
          Text(
            "tab view of filtered order "
            "list which is Antrian, proses, siap, selesai",
          ),
        ],
      ),
    );
  }
}
