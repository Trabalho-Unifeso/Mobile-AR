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

class ScaffoldBase extends StatelessWidget {
  final Widget body;
  const ScaffoldBase({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9E9DA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF9E9DA),
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(logo, semanticsLabel: 'Logo'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFFAF651F)),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Venda Móveis Online')),
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
                MaterialPageRoute(builder: (context) => const PaginaCarrinho()),
              );
            },
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFFAF651F)),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: body,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(child: Text('Menu')),
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
    return ScaffoldBase(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
                      const Text(
                        'Mesa de Escritório',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Descrição',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Text(
                            'R\$ 1.000,00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFAF651F),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                color: Color(0xFFF9E9DA),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaginaProduto(),
                                  ),
                                );
                              },
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
class PaginaProduto extends StatelessWidget {
  const PaginaProduto({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
        body: Title(
          color: Colors.black,
          child: Text(
              'PaginaProduto'
          ),
        )
    );
  }
}
class PaginaCarrinho extends StatelessWidget{
  const PaginaCarrinho ({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      body: Title(
          color: Colors.black,
          child: Text(
              'PaginaCarrinho'
          ),
      )
    );
  }
}