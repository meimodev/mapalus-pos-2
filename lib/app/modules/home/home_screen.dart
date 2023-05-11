import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/widgets/order_overview_item.dart';
import 'package:mapalus_pos_2/app/widgets/screen_wrapper.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const ScreenWrapper(
      children: [
        _BuildCurrentStoreAndAccount(
          storeName: 'Jhon Laundry',
          address: 'Tondano, Minahasa',
          currentUserName: 'Jhon Sumongko',
        ),
        SizedBox(height: Insets.medium),
        _BuildCurrentOverviewCard(
          currentRevenue: 'Rp. 999.000.000',
          data: [
            {'text': '50', 'value': 'Antrian'},
            {'text': '10', 'value': 'Selesai hari ini'},
            {'text': '20', 'value': 'Terlambat'},
          ],
        ),
        SizedBox(height: Insets.medium),
        _BuildButtonRow(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _BuildButtonRow extends StatelessWidget {
  const _BuildButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ButtonRowItem(
          iconData: Icons.shopping_bag_rounded,
          text: 'Tambah Pesanan',
          iconColor: Theme.of(context).colorScheme.primary,
          onPressed: () =>Navigator.pushNamed(context, Routes.transaction),
        ),
        _ButtonRowItem(
          iconData: Icons.add_business_rounded,
          text: 'Tambah Pengeluaran',
          iconColor: Theme.of(context).colorScheme.primary,
          onPressed: () =>Navigator.pushNamed(context, Routes.expense),
        ),
        _ButtonRowItem(
          iconData: Icons.receipt_rounded,
          text: 'Cari Pesanan',
          iconColor: Theme.of(context).colorScheme.primary,
          onPressed: () =>Navigator.pushNamed(context, Routes.searchTransaction),
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
    this.iconColor,
  });

  final IconData iconData;
  final String text;
  final void Function() onPressed;
  final Color? iconColor;

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
                child: Icon(iconData, color: iconColor),
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
    required this.data,
  }) : super(key: key);

  final String currentRevenue;
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(Insets.small),
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(Insets.medium),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Omzet Hari Ini",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                ),
                Text(
                  currentRevenue,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: Insets.small),
            Divider(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            const SizedBox(height: Insets.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < data.length; i++)
                  OrderOverviewItem(
                    text: data[i]["text"],
                    value: data[i]["value"],
                    textColor: Colors.white,
                    valueColor: Theme.of(context).colorScheme.primaryContainer,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
