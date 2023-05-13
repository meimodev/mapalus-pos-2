import 'package:get/get.dart';
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
import 'package:mapalus_pos_2/app/modules/transaction/transaction_binding.dart';
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

  static List<GetPage> get getRoutes {
    return [
      GetPage(
        name: home,
        page: () => const BottomNavBarScreen(),
      ),
      GetPage(
        name: transaction,
        page: () => TransactionScreen(),
        binding: TransactionBindings(),
      ),
      GetPage(
        name: orderDetail,
        page: () => const OrderDetailScreen(),
      ),
      GetPage(
        name: expense,
        page: () => const ExpenseScreen(),
      ),
      GetPage(
        name: searchTransaction,
        page: () => const SearchTransactionScreen(),
      ),
      GetPage(
        name: reportTransaction,
        page: () => const ReportTransactionScreen(),
      ),
      GetPage(
        name: reportOrder,
        page: () => const ReportOrderScreen(),
      ),
      GetPage(
        name: settingStore,
        page: () => const SettingStoreScreen(),
      ),
      GetPage(
        name: settingAccount,
        page: () => const SettingAccountScreen(),
      ),
      GetPage(
        name: settingPrinter,
        page: () => const SettingPrinterScreen(),
      ),
      GetPage(
        name: settingBranch,
        page: () => const SettingBranchScreen(),
      ),
      GetPage(
        name: settingMember,
        page: () => const SettingMemberScreen(),
      ),
      GetPage(
        name: settingCrew,
        page: () => const SettingCrewScreen(),
      ),
      GetPage(
        name: productDetail,
        page: () => const ProductDetailScreen(),
      ),
    ];
  }
}
