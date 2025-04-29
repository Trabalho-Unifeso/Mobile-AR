import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/home_page.dart';
import '../pages/cart_page.dart';
import '../data/product_data.dart'; // necessário para acessar cartProducts.length

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
        // Ícone do carrinho com badge
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Color(0xFFAF651F)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartPage()),
                  );
                },
              ),
              if (cartProducts.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(minWidth: 7, minHeight: 7),
                    child: Text(
                      '${cartProducts.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
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
