import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapalus_pos_2/app/widgets/screen_wrapper.dart';
import 'package:mapalus_pos_2/data/models/product.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

import 'transaction_controller.dart';

class TransactionScreen extends GetView<TransactionController> {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      disableParentScrolling: true,
      useScaffold: true,
      appBar: const CustomAppBar(),
      children: [
        Obx(
          () => Text(
            "Total produk (${controller.storeProducts.length})",
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(height: Insets.small),
        Expanded(
          child: Obx(
            () => ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: Insets.large),
              itemCount: controller.storeProducts.length,
              itemBuilder: (context, index) {
                if (index == controller.storeProducts.length - 1) {
                  return const _BuildAddProduct();
                }
                final p = controller.storeProducts[index];
                return CardProductItem(
                  onPressed: (_) {},
                  product: Product(
                    name: p.name,
                    price: p.price,
                    stock: p.stock,
                  ),
                );
              },
            ),
          ),
        ),
        const _BuildOrderOverview(),
      ],
    );
  }
}

class _BuildAddProduct extends StatelessWidget {
  const _BuildAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          clipBehavior: Clip.antiAlias,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.productDetail),
            child: Padding(
              padding: const EdgeInsets.all(Insets.small),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: Insets.small),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tambah produk",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: Insets.small),
      ],
    );
  }
}

class _BuildOrderOverview extends StatelessWidget {
  const _BuildOrderOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: Insets.medium,
        top: Insets.small,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () {
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp. 999.000.000",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text("4 Product | 5 Unit",
                    style: Theme.of(context).textTheme.labelMedium),
              ],
            );
            },
          ),
          FilledButton(
            onPressed: () {},
            child: Text("LANJUT"),
          ),
        ],
      ),
    );
  }
}

class CardProductItem extends StatelessWidget {
  const CardProductItem({
    super.key,
    required this.product,
    required this.onPressed,
  });

  final Product product;
  final void Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.hardEdge,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: InkWell(
            onTap: () {
              onPressed(product);
            },
            child: Padding(
              padding: const EdgeInsets.all(Insets.small),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                    child: Text(
                      product.name.toInitials.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: Insets.small),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(product.price.formatNumberToCurrency(),
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      product.stock != null
                          ? Row(
                              children: [
                                const Icon(
                                  Icons.inventory_2_outlined,
                                  size: 14,
                                ),
                                const SizedBox(width: 3),
                                Text(product.stock.toString()),
                                const SizedBox(width: Insets.small),
                              ],
                            )
                          : const SizedBox(),
                      Icon(
                        Icons.add,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: Insets.small),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Insets.medium),
      padding: const EdgeInsets.only(
        left: Insets.small,
        right: Insets.medium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, size: 30),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: Insets.small),
          Text(
            "Buat Pesanan",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
