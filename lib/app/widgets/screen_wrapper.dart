import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

enum ScreenWrapperState { loading, loaded, error }

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    Key? key,
    required this.children,
    this.crossAxisAlignment,
    this.disableParentScrolling = false,
    this.appBar,
    this.useScaffold = false,
    this.state,
  }) : super(key: key);

  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool disableParentScrolling;
  final bool useScaffold;
  final Widget? appBar;
  final ScreenWrapperState? state;

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
          child: _BuildLayoutBasedOnState(
            state: state,
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

class _BuildLayoutBasedOnState extends StatelessWidget {
  const _BuildLayoutBasedOnState({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final ScreenWrapperState? state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (state == ScreenWrapperState.loading) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    if (state == ScreenWrapperState.error) {
      return const Center(
        child: Text("An Error Occurred"),
      );
    }
    return child;
  }
}
