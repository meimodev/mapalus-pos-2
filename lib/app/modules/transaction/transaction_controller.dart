import 'package:get/get.dart';
import 'package:mapalus_pos_2/app/widgets/screen_wrapper.dart';
import 'package:mapalus_pos_2/data/models/product.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class TransactionController extends GetxController {
  RxList<Product> storeProducts = <Product>[].obs;
  List<Product> orderedProducts = <Product>[];

  var orderedProductsTotalPrice = "-".obs;
  var orderedProductsTotalCount = "-".obs;

  Rx<ScreenWrapperState> loadingState = ScreenWrapperState.loaded.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStoreProductList();
  }

  void fetchStoreProductList() async {
    loadingState.value = ScreenWrapperState.loading;
    await Future.delayed(const Duration(seconds: 2));
    storeProducts.addAll([
      Product(name: "Coffee Jhon", price: 4000),
      Product(name: "Coffee Jhon", price: 4000),
      Product(name: "Coffee Jhon", price: 4000, stock: 44),
      Product(name: "Coffee Jhon", price: 4000),
    ]);
    loadingState.value = ScreenWrapperState.loaded;
  }

  void calculateOrderOverview() {
    int resPrice = 0;
    for (Product p in orderedProducts) {
      resPrice += p.price;
    }

    orderedProductsTotalPrice.value = resPrice.formatNumberToCurrency();
    orderedProductsTotalCount.value = "${orderedProducts.length} Produk";

  }

  void onPressedProductCardItem(Product product) {
    orderedProducts.add(product);
    calculateOrderOverview();
  }

  void onPressedNext() {}

  void onPressedAddProduct() {}
}
