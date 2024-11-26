import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Drawer(
      child: Column(
        children: [
          // Cabeçalho com as informações do usuário
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(user?.photoURL ?? 'https://www.example.com/default-avatar.png'),
                ),
                SizedBox(height: 10),
                Text(
                  user?.displayName ?? 'Nome do usuário',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  user?.email ?? 'E-mail não disponível',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          
          // Itens do Drawer
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text("Meus Veículos"),
            onTap: () {
              Navigator.pushNamed(context, '/meusVeiculos');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Adicionar Veículo"),
            onTap: () {
              Navigator.pushNamed(context, '/adicionarVeiculo');
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Histórico de Abastecimentos"),
            onTap: () {
              Navigator.pushNamed(context, '/historicoAbastecimentos');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Perfil"),
            onTap: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
