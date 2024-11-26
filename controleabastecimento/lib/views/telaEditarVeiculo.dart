import 'package:flutter/material.dart';
import '../controllers/veiculoController.dart';
import '../models/veiculoModel.dart';
import '../widget/veiculoForm.dart';

class VeiculoEditarView extends StatelessWidget {
  final String usuarioId;
  final VeiculoModel veiculo;

  VeiculoEditarView({
    required this.usuarioId,
    required this.veiculo,
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _modeloController = TextEditingController();
  final _anoController = TextEditingController();
  final _placaController = TextEditingController();

  final VeiculoController _controller = VeiculoController();

  @override
  Widget build(BuildContext context) {
    // Preenche os campos com os dados do veículo
    _nomeController.text = veiculo.nome;
    _modeloController.text = veiculo.modelo;
    _anoController.text = veiculo.ano.toString();
    _placaController.text = veiculo.placa;

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Veículo')),
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
              final veiculoAtualizado = VeiculoModel(
                id: veiculo.id,
                nome: _nomeController.text,
                modelo: _modeloController.text,
                ano: int.parse(_anoController.text),
                placa: _placaController.text,
                usuarioId: usuarioId,
              );
              await _controller.updateVeiculo(usuarioId, veiculo.id, veiculoAtualizado);
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
