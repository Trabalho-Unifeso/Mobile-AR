import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/home_page.dart';
import '../pages/cart_page.dart';

const String logo = 'assets/logo.svg';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF9E9DA),
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SvgPicture.asset(logo, semanticsLabel: 'Logo'),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.home, color: Color(0xFFAF651F)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage(title: 'Venda Móveis Online')),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Color(0xFFAF651F)),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Color(0xFFAF651F)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            );
          },
        ),
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFFAF651F)),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }
}
