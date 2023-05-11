import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/modules/home/expense/expense_screen.dart';
import 'package:mapalus_pos_2/app/modules/order_detail/order_detail_screen.dart';
import 'package:mapalus_pos_2/app/modules/product_detail/product_detail_screen.dart';
import 'package:mapalus_pos_2/app/modules/report/report_order/report_order_screen.dart';
import 'package:mapalus_pos_2/app/modules/report/report_transaction/report_transaction_screen.dart';
import 'package:mapalus_pos_2/app/modules/setting/setting_account/setting_account_screen.dart';
import 'package:mapalus_pos_2/app/modules/setting/setting_branch/setting_branch_screen.dart';
import 'package:mapalus_pos_2/app/modules/setting/setting_crew/setting_crew_screen.dart';
import 'package:mapalus_pos_2/app/modules/setting/setting_member/setting_printer_member.dart';
import 'package:mapalus_pos_2/app/modules/setting/setting_printer/setting_printer_screen.dart';
import 'package:mapalus_pos_2/app/modules/setting/setting_store/setting_store_screen.dart';
import 'package:mapalus_pos_2/app/modules/transaction/search_transaction/search_transaction_screen.dart';
import 'package:mapalus_pos_2/app/modules/transaction/transaction_screen.dart';
import 'package:mapalus_pos_2/app/widgets/bottom_nav_bar_screen.dart';

class Routes {
  static const String home = '/';
  static const String transaction = '/transaction';
  static const String orderDetail = '/order-detail';
  static const String expense = '/expense';
  static const String searchTransaction = '/search-transaction';

  static const String reportTransaction = '/report-transaction';
  static const String reportOrder = '/report-order';

  static const String settingStore = '/setting-store';
  static const String settingAccount = '/setting-account';
  static const String settingPrinter = '/setting-printer';
  static const String settingBranch = '/setting-branch';
  static const String settingMember = '/setting-member';
  static const String settingCrew = '/setting-crew';

  static const String productDetail = '/product-detail';

  static Map<String, Widget Function(BuildContext)> get getRoutes {
    return {
      home: (_) => const BottomNavBarScreen(),
      transaction: (_) =>  TransactionScreen(),
      orderDetail: (_) => const OrderDetailScreen(),
      expense: (_) => const ExpenseScreen(),
      searchTransaction: (_) => const SearchTransactionScreen(),
      reportTransaction: (_) => const ReportTransactionScreen(),
      reportOrder: (_) => const ReportOrderScreen(),
      settingStore: (_) => const SettingStoreScreen(),
      settingAccount: (_) => const SettingAccountScreen(),
      settingPrinter: (_) => const SettingPrinterScreen(),
      settingBranch: (_) => const SettingBranchScreen(),
      settingMember: (_) => const SettingMemberScreen(),
      settingCrew: (_) => const SettingCrewScreen(),
      productDetail: (_) => const ProductDetailScreen(),
    };
  }
}
