import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/widgets/card_item_order.dart';
import 'package:mapalus_pos_2/data/models/order.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: Insets.large),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
          child: Text(
            "Sunday, 12 January 2023",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: Insets.small),
        const Expanded(
          child: _BuildOrderStatusTabBar(),
        ),
      ],
    );
  }
}

class _BuildOrderStatusTabBar extends StatelessWidget {
  const _BuildOrderStatusTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Order> orders = [
      Order(
        invoiceNumber: '0031',
        memberName: 'Makawembeng Jhon',
        orderDate: DateTime.now().subtract(const Duration(days: 1)),
        finishDate: DateTime.now().add(const Duration(hours: 68)),
        totalWeight: 123.4,
        orderPrice: 999000000,
        totalProduct: 2,
        orderState: OrderState.queue,
        isPaid: false,
      ),
      Order(
        invoiceNumber: '1696',
        memberName: 'Some Jhon',
        orderDate: DateTime.now().subtract(Duration(minutes: 20)),
        finishDate: DateTime.now(),
        totalWeight: 104.5,
        orderPrice: 1800000,
        totalProduct: 6,
        orderState: OrderState.queue,
      ),
      Order(
        invoiceNumber: '0031',
        memberName: 'Makawembeng Jhon',
        orderDate: DateTime.now().subtract(const Duration(days: 1)),
        finishDate: DateTime.now().add(const Duration(hours: 68)),
        totalWeight: 123.4,
        orderPrice: 999000000,
        totalProduct: 2,
        isPaid: false,
        orderState: OrderState.process,
      ),
      Order(
        invoiceNumber: '1696',
        memberName: 'Some Jhon',
        orderDate: DateTime.now().subtract(const Duration(days: 2)),
        finishDate: DateTime.now(),
        totalWeight: 104.5,
        orderPrice: 1800000,
        totalProduct: 6,
        orderState: OrderState.ready,
      ),
      Order(
        invoiceNumber: '0031',
        memberName: 'Makawembeng Jhon',
        orderDate: DateTime.now().subtract(const Duration(days: 1)),
        finishDate: DateTime.now().add(const Duration(hours: 68)),
        totalWeight: 123.4,
        orderPrice: 999000000,
        totalProduct: 2,
        isPaid: false,
        orderState: OrderState.done,
      ),
      Order(
        invoiceNumber: '1696',
        memberName: 'Some Jhon',
        orderDate: DateTime.now().subtract(const Duration(days: 2)),
        finishDate: DateTime.now(),
        totalWeight: 104.5,
        orderPrice: 1800000,
        totalProduct: 6,
      ),
    ];

    final List<Order> ordersQueue = orders
        .where((element) => element.orderState == OrderState.queue)
        .toList();
    final List<Order> ordersProcess = orders
        .where((element) => element.orderState == OrderState.process)
        .toList();

    final List<Order> ordersReady = orders
        .where((element) => element.orderState == OrderState.ready)
        .toList();

    final List<Order> ordersDone = orders
        .where((element) => element.orderState == OrderState.done)
        .toList();

    final List<Order> ordersCancel = orders
        .where((element) => element.orderState == OrderState.canceled)
        .toList();

    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            isScrollable: false,
            labelStyle: Theme.of(context).textTheme.labelSmall,
            physics: const BouncingScrollPhysics(),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: _buildTabTitleText(list: ordersQueue, title: "Antrian"),
              ),
              Tab(
                child: _buildTabTitleText(list: ordersProcess, title: "Proses"),
              ),
              Tab(
                child: _buildTabTitleText(list: ordersReady, title: "Siap"),
              ),
              Tab(
                child: _buildTabTitleText(list: ordersDone, title: "Selesai"),
              ),
              Tab(
                child: _buildTabTitleText(list: ordersCancel, title: "Batal"),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                TabBarViewBody(
                  orders: ordersQueue,
                ),
                TabBarViewBody(
                  orders: ordersProcess,
                ),
                TabBarViewBody(
                  orders: ordersReady,
                ),
                TabBarViewBody(
                  orders: ordersDone,
                ),
                TabBarViewBody(
                  orders: ordersCancel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabTitleText({
    required List list,
    required String title,
  }) =>
      Text(
        "$title ${list.isNotEmpty ? "\n(${list.length})" : ""}",
        textAlign: TextAlign.center,
      );
}

class TabBarViewBody extends StatelessWidget {
  const TabBarViewBody({Key? key, required this.orders}) : super(key: key);

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {

    if (orders.isEmpty) {
      return const Center(
        child: Text("Tidak ada data -_-"),
      );
    }

    return ListView.builder(
      itemCount: orders.length,
      physics: const BouncingScrollPhysics(),
      primary: true,
      padding: const EdgeInsets.only(
        left: Insets.medium,
        right: Insets.medium,
        top: Insets.small,
        bottom: Insets.large * 2,
      ),
      itemBuilder: (context, index) => CardItemOrder(
        onPressed: () => Navigator.pushNamed(context, Routes.orderDetail),
        order: orders[index],
      ),
    );
  }
}
