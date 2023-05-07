import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/widgets/screen_wrapper.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      children: [
        _BuildCurrentStoreAndAccount(
          storeName: 'Jhon Laundry',
          address: 'Tondano, Minahasa',
          currentUserName: 'Jhon Sumongko',
        ),
        SizedBox(height: Insets.medium),
        _BuildCurrentOverviewCard(
          currentRevenue: 'Rp. 999.000.000',
          currentOrderCounts: [
            999,
            256,
            2,
          ],
        ),
        SizedBox(height: Insets.medium),
        _BuildButtonRow(),
      ],
    );
  }
}

class _BuildButtonRow extends StatelessWidget {
  const _BuildButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ButtonRowItem(
          iconData: Icons.shopping_bag_outlined,
          text: 'Tambah Pesanan',
          onPressed: () {},
        ),
        _ButtonRowItem(
          iconData: Icons.abc,
          text: 'Tambah Pengeluaran',
          onPressed: () {},
        ),
        _ButtonRowItem(
          iconData: Icons.accessibility_sharp,
          text: 'Cari Pesanan',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ButtonRowItem extends StatelessWidget {
  const _ButtonRowItem({
    required this.iconData,
    required this.text,
    required this.onPressed,
  });

  final IconData iconData;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(Insets.small * .5),
          width: 100,
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(iconData),
              ),
              const SizedBox(height: Insets.small),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildCurrentStoreAndAccount extends StatelessWidget {
  const _BuildCurrentStoreAndAccount({
    Key? key,
    required this.storeName,
    required this.address,
    required this.currentUserName,
  }) : super(key: key);

  final String storeName;
  final String address;
  final String currentUserName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              storeName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              address,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        Column(
          children: [
            CircleAvatar(child: Text(currentUserName.toInitials)),
            const SizedBox(height: Insets.small * .5),
            Text(
              currentUserName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}

class _BuildCurrentOverviewCard extends StatelessWidget {
  const _BuildCurrentOverviewCard({
    Key? key,
    required this.currentRevenue,
    required this.currentOrderCounts,
  }) : super(key: key);

  final String currentRevenue;
  final List<int> currentOrderCounts;

  @override
  Widget build(BuildContext context) {
    return Material(
      textStyle: const TextStyle(color: Colors.white),
      child: Container(
        padding: const EdgeInsets.all(Insets.medium),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Insets.small),
          color: Colors.grey.shade800,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Omzet Hari Ini",
                ),
                Text(currentRevenue),
              ],
            ),
            const SizedBox(height: Insets.small),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(height: Insets.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _OrderOverviewItem(
                    text: currentOrderCounts[0].toString(), value: "Masuk"),
                _OrderOverviewItem(
                    text: currentOrderCounts[1].toString(), value: "Proses"),
                _OrderOverviewItem(
                    text: currentOrderCounts[2].toString(), value: "Selesai"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _OrderOverviewItem extends StatelessWidget {
  const _OrderOverviewItem({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: Insets.small * .5,
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
