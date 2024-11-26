import 'package:controleabastecimento/views/homeview.dart';
import 'package:controleabastecimento/views/telaAbastecimento.dart';
import 'package:controleabastecimento/views/telaVeiculo.dart';
import 'package:flutter/material.dart';
import 'views/telaLoginCadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Abastecimento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/Login': (context) => const LoginView(),
        '/Home': (context) => HomeView(),
        '/Veiculos': (context) => VeiculoView(usuarioId: '',),
        '/historico_abastecimentos': (context) => AbastecimentoView(usuarioId: '', veiculoId: '',),
        '/perfil': (context) => HomeView(),
      },
    );
  }
}
