enum OrderState{queue, process, ready, done, canceled}

class Order {
  final String invoiceNumber;
  final String memberName;
  final DateTime orderDate;
  final DateTime finishDate;
  final double totalWeight;
  final int orderPrice;
  final int totalProduct;
  final bool isPaid;
  final OrderState orderState;

  const Order({
    required this.invoiceNumber,
    required this.memberName,
    required this.orderDate,
    required this.finishDate,
    required this.totalWeight,
    required this.orderPrice,
    required this.totalProduct,
    this.orderState = OrderState.queue,
    this.isPaid = true,
  });

  @override
  String toString() {
    return 'Order{invoiceNumber: $invoiceNumber, memberName: $memberName, orderDate: $orderDate, finishDate: $finishDate, totalWeight: $totalWeight, orderPrice: $orderPrice, totalProduct: $totalProduct, isPaid: $isPaid, orderState: $orderState}';
  }
}
