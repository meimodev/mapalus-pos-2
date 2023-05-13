
import 'package:get/get.dart';
import 'package:mapalus_pos_2/data/models/product.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class TransactionController extends GetxController{

  RxList<Product> storeProducts = [
    Product(name: "Coffee Jhon", price: 4000),
    Product(name: "Coffee Jhon", price: 4000),
    Product(name: "Coffee Jhon", price: 4000, stock: 44),
    Product(name: "Coffee Jhon", price: 4000),
  ].obs;
  List<Product> orderedProducts = <Product>[];

  var orderedProductsTotalPrice = "-".obs;
  var orderedProductsTotalCount = "-".obs;

  void calculateOrderOverview(){

    int resPrice=0;
    for(Product p in orderedProducts){
      resPrice+=p.price;
    }

    orderedProductsTotalPrice.value = resPrice.formatNumberToCurrency();
    orderedProductsTotalCount.value = "${orderedProducts.length} Produk";
  }

  void onPressedProductCardButton(Product product){
    orderedProducts.add(product);
    calculateOrderOverview();
  }


}