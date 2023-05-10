import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class OrderOverviewItem extends StatelessWidget {
  const OrderOverviewItem({
    Key? key,
    required this.text,
    required this.value,
    this.textColor,
    this.valueColor,
    this.isDense = false,
  }) : super(key: key);

  final String text;
  final String value;
  final Color? textColor;
  final Color? valueColor;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.white,
                fontSize: isDense ? 24 : 24,
              ),
        ),
        const SizedBox(
          height: Insets.small * .5,
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: valueColor ?? Colors.white),
        ),
      ],
    );
  }
}
