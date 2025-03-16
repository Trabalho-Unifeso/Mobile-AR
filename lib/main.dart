import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
const String logo = 'assets/logo.svg';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venda de Móveis Online',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Venda Móveis Online'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header
      backgroundColor: Color(0xFFF9E9DA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF9E9DA),
        leading: SvgPicture.asset(
          logo,
          semanticsLabel: 'Logo',
        ), // ícone da empresa
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.home, color: Color(0xFFAF651F)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search, color: Color(0xFFAF651F)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart, color: Color(0xFFAF651F)), onPressed: () {}),
          Builder( // esse builder é necessário para colocar o Drawer a direita
            builder:
                (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFFAF651F)),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
          ),
        ],
      ),
      // Drawer (menu lateral)
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(child: Text('Menu')),
            // adicionar itens do menu aqui
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Minha Conta')
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Preciso de Ajuda'),
            ),
          ],
        ),
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column( // essa estrutura pode ser alterada conforme o projeto for progredindo
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 50,
              child: SearchBar(
                hintText: 'Buscar produto...',
                leading: SvgPicture.asset(
                  logo,
                  semanticsLabel: 'Logo',
                ),
                backgroundColor: WidgetStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
