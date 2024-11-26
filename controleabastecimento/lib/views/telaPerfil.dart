import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:controleabastecimento/controllers/usuarioController.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final UsuarioController _usuarioController = UsuarioController();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  // Carregar os dados do usuário
  void _loadUserProfile() {
    // Carregar dados do usuário autenticado
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _nomeController.text = user.displayName ?? 'Nome não disponível';
      _emailController.text = user.email ?? 'E-mail não disponível';
    }
  }

  // Salvar alterações no perfil
  void _saveProfile() async {
    String novoNome = _nomeController.text;
    String novoEmail = _emailController.text;

    bool nomeAtualizado = await _usuarioController.atualizarNome(novoNome);
    bool emailAtualizado = await _usuarioController.atualizarEmail(novoEmail);

    if (nomeAtualizado && emailAtualizado) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil atualizado com sucesso!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao atualizar perfil.')),
      );
    }
  }

  // Função de logout
  void _logout() {
    _usuarioController.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.example.com/foto.jpg', // Exemplo de URL de foto
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "E-mail"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Nova Senha"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text("Salvar Alterações"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: const Text("Logout"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
