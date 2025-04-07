import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/product_grid.dart';
import '../widgets/scaffold_base.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      appBar: const CustomAppBar(),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            CustomSearchBar(),
            SizedBox(height: 10),
            ProductGrid(),
          ],
        ),
      ),
    );
  }
}
