import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Insets.medium,
        right: Insets.medium,
        top: Insets.large,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
