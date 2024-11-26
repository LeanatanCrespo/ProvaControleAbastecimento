import 'package:flutter/material.dart';

class VeiculoForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nomeController;
  final TextEditingController modeloController;
  final TextEditingController anoController;
  final TextEditingController placaController;
  final VoidCallback onSave;

  const VeiculoForm({
    required this.formKey,
    required this.nomeController,
    required this.modeloController,
    required this.anoController,
    required this.placaController,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome do Veículo'),
            validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
          ),
          TextFormField(
            controller: modeloController,
            decoration: const InputDecoration(labelText: 'Modelo do Veículo'),
            validator: (value) => value == null || value.isEmpty ? 'Informe o modelo' : null,
          ),
          TextFormField(
            controller: anoController,
            decoration: const InputDecoration(labelText: 'Ano'),
            keyboardType: TextInputType.number,
            validator: (value) => value == null || value.isEmpty ? 'Informe o ano' : null,
          ),
          TextFormField(
            controller: placaController,
            decoration: const InputDecoration(labelText: 'Placa'),
            validator: (value) => value == null || value.isEmpty ? 'Informe a placa' : null,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onSave,
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
