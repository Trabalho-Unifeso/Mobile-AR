import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/scaffold_base.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      appBar: const CustomAppBar(),
      endDrawer: const CustomDrawer(),
      body: const Center(
        child: Text(
          'Seu carrinho está vazio!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
