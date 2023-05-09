import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/data/models/order.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class CardItemOrder extends StatelessWidget {
  const CardItemOrder({
    super.key,
    required this.onPressed,
    required this.order,
  });

  final void Function() onPressed;
  final Order order;


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
                        "#${order.invoiceNumber}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: Insets.small),
                    Text(
                      order.memberName,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          order.isPaid ? const SizedBox() : const SizedBox(width: 3),
                          order.isPaid
                              ? const SizedBox()
                              : const Icon(Icons.money_off_outlined),
                          order.isPaid
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
                              order.orderDate.fromNowHumanReadable(),
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
                              order.finishDate.fromNowHumanReadable(),
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
                            "${order.totalWeight} Kg",
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
                                  order.orderPrice.formatNumberToCurrency(),
                                  style:
                                  Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "${order.totalProduct} Produk",
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