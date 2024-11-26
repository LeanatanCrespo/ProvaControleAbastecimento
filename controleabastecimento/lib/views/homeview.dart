//import 'package:controleabastecimento/widget/drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Meus Veículos'),
              onTap: () {
                Navigator.pushNamed(context, '/veiculos');
              },
            ),
            ListTile(
              title: const Text('Adicionar Veículo'),
              onTap: () {
                Navigator.pushNamed(context, '/adicionar_veiculo');
              },
            ),
            ListTile(
              title: const Text('Histórico de Abastecimentos'),
              onTap: () {
                Navigator.pushNamed(context, '/historico_abastecimentos');
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/perfil');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Lista de veículos aqui...'),
      ),
    );
  }
}
