import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controllers/abastecimentoController.dart';
import '../models/abastecimentoModel.dart';

class AbastecimentoView extends StatelessWidget {
  final String usuarioId;
  final String veiculoId;

  AbastecimentoView({required this.usuarioId, required this.veiculoId, Key? key}) : super(key: key);

  final AbastecimentoController _abastecimentoController = AbastecimentoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Abastecimentos')),
      body: StreamBuilder<List<AbastecimentoModel>>(
        stream: _abastecimentoController.fetchAbastecimentos(usuarioId, veiculoId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar o histórico.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum abastecimento registrado.'));
          } else {
            final abastecimentos = snapshot.data!;
            return ListView.builder(
              itemCount: abastecimentos.length,
              itemBuilder: (context, index) {
                final abastecimento = abastecimentos[index];
                return ListTile(
                  title: Text('Litros: ${abastecimento.litro.toStringAsFixed(2)}'),
                  subtitle: Text('Km: ${abastecimento.quilometragem.toStringAsFixed(0)}'),
                  trailing: Text(DateFormat('dd/MM/yyyy').format(abastecimento.data)),
                );
              },
            );
          }
        },
      ),
    );
  }
}

