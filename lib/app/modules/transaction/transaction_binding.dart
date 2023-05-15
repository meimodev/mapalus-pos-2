import 'package:get/get.dart';

import 'transaction_controller.dart';
class TransactionBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(TransactionController());
  }

}