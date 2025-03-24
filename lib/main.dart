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
      debugShowCheckedModeBanner: false,
      title: 'Venda de Móveis Online',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF9E9DA)),
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
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(logo, semanticsLabel: 'Logo'),
        ), // ícone da empresa
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFFAF651F)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFFAF651F)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Color(0xFFAF651F)),
            onPressed: () {},
          ),
          Builder(
            // esse builder é necessário para colocar o Drawer a direita
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
              title: Text('Minha Conta'),
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
        child: Column(
          // essa estrutura pode ser alterada conforme o projeto for progredindo
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
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
            ),
            // Card do Produto
            Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/mesa-escritorio.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mesa de Escritório',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Descrição',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'R\$ 1.000,00',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFAF651F),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Color(0xFFF9E9DA),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
