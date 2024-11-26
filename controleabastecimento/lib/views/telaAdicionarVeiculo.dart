import 'package:flutter/material.dart';
import '../controllers/veiculoController.dart';
import '../models/veiculoModel.dart';
import '../widget/veiculoForm.dart';

class AdicionarVeiculoView extends StatelessWidget {
  final String usuarioId;
  AdicionarVeiculoView({required this.usuarioId, Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _modeloController = TextEditingController();
  final _anoController = TextEditingController();
  final _placaController = TextEditingController();

  final VeiculoController _controller = VeiculoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Veículo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: VeiculoForm(
          formKey: _formKey,
          nomeController: _nomeController,
          modeloController: _modeloController,
          anoController: _anoController,
          placaController: _placaController,
          onSave: () async {
            if (_formKey.currentState!.validate()) {
              final novoVeiculo = VeiculoModel(
                id: '', // Gerado automaticamente pelo Firestore
                nome: _nomeController.text,
                modelo: _modeloController.text,
                ano: int.parse(_anoController.text),
                placa: _placaController.text,
                usuarioId: usuarioId,
              );
              await _controller.addVeiculo(novoVeiculo, usuarioId);
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
