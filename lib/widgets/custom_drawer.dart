import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
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
    );
  }
}
