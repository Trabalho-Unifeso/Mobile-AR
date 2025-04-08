import 'package:flutter/material.dart';

class ScaffoldBase extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color backgroundColor;

  const ScaffoldBase({
    super.key,
    this.appBar,
    required this.body,
    this.drawer,
    this.endDrawer,
    this.backgroundColor = const Color(0xFFF9E9DA),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      body: body,
      resizeToAvoidBottomInset: false,
    );
  }
}
