import 'package:flutter/material.dart';
import '../controllers/abastecimentoController.dart';
import '../models/abastecimentoModel.dart';

class RegistrarAbastecimentoView extends StatelessWidget {
  final String usuarioId;
  final String veiculoId;

  RegistrarAbastecimentoView({required this.usuarioId, required this.veiculoId, Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _litrosController = TextEditingController();
  final _quilometragemController = TextEditingController();

  final AbastecimentoController _abastecimentoController = AbastecimentoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Abastecimento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _litrosController,
                decoration: InputDecoration(labelText: 'Litros Abastecidos'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade de litros';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quilometragemController,
                decoration: InputDecoration(labelText: 'Quilometragem Atual'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quilometragem atual';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newAbastecimento = AbastecimentoModel(
                      id: null,
                      litro: double.parse(_litrosController.text),
                      quilometragem: double.parse(_quilometragemController.text),
                      data: DateTime.now(),
                      veiculoId: veiculoId,
                    );
                    await _abastecimentoController.addAbastecimento(usuarioId, veiculoId, newAbastecimento);
                    Navigator.pop(context);
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
