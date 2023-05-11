class Product {
  String name;
  int price;
  int? stock;

  Product({
    required this.name,
    required this.price,
    this.stock,
  });

  @override
  String toString() {
    return 'Product{name: $name, price: $price, stock: $stock}';
  }
}
