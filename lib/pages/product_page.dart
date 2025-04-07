import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/scaffold_base.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override

  Widget build(BuildContext context) {
    return ScaffoldBase(
      appBar: const CustomAppBar(),
      endDrawer: const CustomDrawer(),
      body: Center(child: Text(product.name)),
    );
  }
}
