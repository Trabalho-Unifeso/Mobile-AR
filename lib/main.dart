import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Venda de Móveis Online',
      theme: appTheme,
      home: const HomePage(title: 'Venda Móveis Online'),
    );
  }
}
