import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String logo = 'assets/logo.svg';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: SearchBar(
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 10),
        ),
        hintText: 'Buscar produto...',
        leading: Opacity(
          opacity: 0.7,
          child: SvgPicture.asset(
            logo,
            semanticsLabel: 'Logo',
            width: 48,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    );
  }
}
