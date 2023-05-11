import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/app/widgets/branch_picker.dart';
import 'package:mapalus_pos_2/app/widgets/order_overview_item.dart';
import 'package:mapalus_pos_2/app/widgets/screen_wrapper.dart';
import 'package:mapalus_pos_2/app/widgets/time_span_picker.dart';
import 'package:mapalus_pos_2/data/models/branch.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      children: [
        BranchPicker(
          branches: [
            Branch(
              name: "Rinegetan",
              address: "Jln. Bakti Abri, No.55",
            ),
            Branch(
              name: "Wawalintouan",
              address: "Kompleks pasar bawah, dekat atm bni",
            ),
          ],
          onSelectBranch: (branch) {
            print("selected branch on report screen $branch");
          },
        ),
        const SizedBox(height: Insets.small),
        TimeSpanPicker(
          onSelectTimeSpan: (DateTimeRange? dateTimeRange) {
            print("selected time span on report screen $dateTimeRange");
          },
        ),
        const SizedBox(height: Insets.small),
        const _BuildCurrentOverviewCard(
          currentRevenue: 'Rp. 999.000.000',
          data: [
            {'text': 'Rp. 990.000.000', 'value': 'Masuk'},
            {'text': 'Rp. 990.000.000', 'value': 'Keluar'},
            {'text': 'Rp. 990.000.000', 'value': 'Untung'},
            {'text': 'Pesanan Masuk', 'value': '999'},
            {'text': 'Pesanan Selesai', 'value': '9.999'},
            {'text': 'Pesanan Batal', 'value': '9.999'},
          ],
        ),
        const SizedBox(height: Insets.small),
         const _BuildSegmentListItem(
           dateTimeRangeFormatted: "Sen, 12 Feb 2023 - Min, 30 Mar 2023",
         ),
      ],
    );
  }
}

class _BuildSegmentListItem extends StatelessWidget {
  const _BuildSegmentListItem({Key? key, required this.dateTimeRangeFormatted}) : super(key: key);

  final String dateTimeRangeFormatted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildListTile(
          context,
          title: "Transaksi Pemasukkan",
          subTitle: dateTimeRangeFormatted,
          iconData: Icons.monetization_on_outlined,
          onPressed: () {
            Navigator.pushNamed(context, Routes.reportTransaction);
          },
        ),
        _buildListTile(
          context,
          title: "Transaksi Pengeluaran",
          subTitle: dateTimeRangeFormatted,
          iconData: Icons.change_circle_outlined,
          onPressed: () {
            Navigator.pushNamed(context, Routes.reportTransaction);
          },
        ),
        _buildListTile(
          context,
          title: "Pesanan Masuk",
          subTitle:dateTimeRangeFormatted,
          iconData: Icons.add_circle_outline,
          onPressed: () {
            Navigator.pushNamed(context, Routes.reportOrder);
          },
        ),
        _buildListTile(
          context,
          title: "Pesanan Selesai",
          subTitle:dateTimeRangeFormatted,
          iconData: Icons.check_circle_outline,
          onPressed: () {
            Navigator.pushNamed(context, Routes.reportOrder);
          },
        ),
        _buildListTile(
          context,
          title: "Pesanan Batal",
          subTitle:dateTimeRangeFormatted,
          iconData: Icons.error_outline_rounded,
          onPressed: () {
            Navigator.pushNamed(context, Routes.reportOrder);
          },
        ),
      ],
    );
  }

  _buildListTile(
    BuildContext context, {
    required String title,
    required String subTitle,
    required IconData iconData,
    required void Function() onPressed,
  }) =>
      ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        leading: Icon(
          iconData,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
        horizontalTitleGap: 5,
        onTap: onPressed,
        dense: true,
      );
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < 3; i++)
                  OrderOverviewItem(
                    value: data[i]["text"],
                    text: data[i]["value"],
                    textColor: Colors.white,
                    valueColor: Theme.of(context).colorScheme.primaryContainer,
                    isDense: true,
                  ),
              ],
            ),
            const SizedBox(height: Insets.small),
            const Divider(),
            const SizedBox(height: Insets.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 3; i < 6; i++)
                  OrderOverviewItem(
                    value: data[i]["text"],
                    text: data[i]["value"],
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
