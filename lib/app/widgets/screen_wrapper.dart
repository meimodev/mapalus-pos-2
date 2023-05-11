import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    Key? key,
    required this.children,
    this.crossAxisAlignment,
    this.disableParentScrolling = false,
    this.appBar,
    this.useScaffold = false,
  }) : super(key: key);

  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool disableParentScrolling;
  final bool useScaffold;
  final Widget? appBar;

  @override
  Widget build(BuildContext context) {
    final widget = Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.stretch,
      children: children,
    );

    final mainWidgetTree = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        appBar ?? const SizedBox(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Insets.medium,
              right: Insets.medium,
              top: Insets.large,
            ),
            child: disableParentScrolling
                ? widget
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: widget,
                  ),
          ),
        ),
      ],
    );

    return useScaffold
        ? SafeArea(
          child: Scaffold(
              body: mainWidgetTree,
            ),
        )
        : mainWidgetTree;
  }
}
