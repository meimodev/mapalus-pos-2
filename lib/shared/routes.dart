
import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/modules/transaction/transaction_screen.dart';
import 'package:mapalus_pos_2/app/widgets/bottom_nav_bar_screen.dart';

class Routes {
  static const String home = '/';
  static const String transaction = '/transaction';

  static  Map<String, Widget Function(BuildContext)> get getRoutes {
    return {
      home: (_) => const BottomNavBarScreen(),
      transaction : (_) => const TransactionScreen(),
    };

  }
}
