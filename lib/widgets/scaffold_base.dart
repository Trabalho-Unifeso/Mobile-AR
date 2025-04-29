import 'package:flutter/material.dart';
import 'package:mobile_ar/widgets/custom_app_bar.dart';
import 'package:mobile_ar/widgets/custom_drawer.dart';

class ScaffoldBase extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color backgroundColor;

  const ScaffoldBase({
    super.key,
    this.appBar = const CustomAppBar(),
    required this.body,
    this.drawer,
    this.endDrawer = const CustomDrawer(),
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
