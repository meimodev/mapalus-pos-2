import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/widgets/screen_wrapper.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      children: [
        Text("Order Detail Screen"),
      ],
    );
  }
}
