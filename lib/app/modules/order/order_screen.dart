import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/widgets/order_overview_item.dart';
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
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            isScrollable: false,
            labelStyle: Theme.of(context).textTheme.labelSmall,
            physics: const BouncingScrollPhysics(),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(icon: Text("Antrian\n(2)", textAlign: TextAlign.center)),
              Tab(icon: Text("Proses\n(2)", textAlign: TextAlign.center)),
              Tab(icon: Text("Siap\n(2)", textAlign: TextAlign.center)),
              Tab(icon: Text("Selesai", textAlign: TextAlign.center)),
              Tab(icon: Text("Batal", textAlign: TextAlign.center)),
            ],
          ),
          const Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                TabBarViewBody(),
                Text("2"),
                Text("2"),
                Text("2"),
                Text("2"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarViewBody extends StatelessWidget {
  const TabBarViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      primary: true,
      padding: const EdgeInsets.only(
        left: Insets.medium,
        right: Insets.medium,
        top: Insets.small,
        bottom: Insets.large * 2,
      ),
      children: [
        CardItemOrder(
          onPressed: () {},
          invoiceNumber: '0031',
          memberName: 'Makawembeng Jhon',
          orderDate: '1 Hari lalu',
          finishDate: '1 Hari lagi',
          totalWeight: 123.4,
          orderPrice: 999000000,
          totalProduct: '5',
          isPaid: false,
        ),
        CardItemOrder(
          onPressed: () {},
          invoiceNumber: '1696',
          memberName: 'Some Jhon',
          orderDate: '2 Hari lalu',
          finishDate: 'Hari ini',
          totalWeight: 99.1,
          orderPrice: 400000,
          totalProduct: '2',
        ),
      ],
    );
  }
}

class CardItemOrder extends StatelessWidget {
  const CardItemOrder({
    super.key,
    required this.onPressed,
    required this.invoiceNumber,
    required this.memberName,
    required this.orderDate,
    required this.finishDate,
    required this.totalWeight,
    required this.orderPrice,
    required this.totalProduct,
    this.isPaid = true,
  });

  final void Function() onPressed;
  final String invoiceNumber;
  final String memberName;
  final String orderDate;
  final String finishDate;
  final double totalWeight;
  final int orderPrice;
  final String totalProduct;

  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Theme.of(context).colorScheme.secondaryContainer,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: onPressed,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: Insets.small,
                        top: Insets.small,
                        bottom: Insets.small,
                        right: Insets.small,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "#$invoiceNumber",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: Insets.small),
                    Text(
                      memberName,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isPaid ? const SizedBox() : const SizedBox(width: 3),
                          isPaid
                              ? const SizedBox()
                              : const Icon(Icons.money_off_outlined),
                          isPaid
                              ? const SizedBox()
                              : const SizedBox(width: Insets.small),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Insets.small * .5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: Insets.small),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.download_outlined,
                              size: 16,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              orderDate,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.download_done_outlined,
                              color: Colors.green,
                              size: 16,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              finishDate,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: Insets.small * .5),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "2",
                          //       style: Theme.of(context).textTheme.titleLarge,
                          //     ),
                          //     Text(
                          //       "Produk",
                          //       style: Theme.of(context).textTheme.titleSmall,
                          //     ),
                          //   ],
                          // ),
                          Text(
                            "$totalWeight Kg",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  orderPrice.formatNumberToCurrency(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "$totalProduct Produk",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Insets.small),
                  ],
                ),
                const SizedBox(height: Insets.small),
              ],
            ),
          ),
        ),
        const SizedBox(height: Insets.small),
      ],
    );
  }
}
