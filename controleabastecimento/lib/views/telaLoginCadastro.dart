import 'package:flutter/material.dart';
import 'package:controleabastecimento/controllers/usuarioController.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _telaLoginCadastro createState() => _telaLoginCadastro();
}

class _telaLoginCadastro extends State<LoginView> {
  final UsuarioController _usuarioController = UsuarioController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Senha"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;
                var user = await _usuarioController.login(email, password);

                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Falha em realizar o login"),
                  ));
                }
              },
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text;
                await _usuarioController.recuperarSenha(email);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Recuperação de senha enviada"),
                ));
              },
              child: const Text("Esqueceu sua senha?"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              child: const Text("Criar conta"),
            ),
          ],
        ),
      ),
    );
  }
}
