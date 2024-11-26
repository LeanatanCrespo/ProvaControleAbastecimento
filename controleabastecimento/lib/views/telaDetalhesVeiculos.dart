import 'package:flutter/material.dart';
import '../controllers/veiculoController.dart';

class DetalhesVeiculoView extends StatefulWidget {
  final String usuarioId;
  final String veiculoId;

  const DetalhesVeiculoView({required this.usuarioId, required this.veiculoId, Key? key}) : super(key: key);

  @override
  _DetalhesVeiculoViewState createState() => _DetalhesVeiculoViewState();
}

class _DetalhesVeiculoViewState extends State<DetalhesVeiculoView> {
  final VeiculoController _veiculoController = VeiculoController();
  late Future<double> _mediaConsumoFuture;

  @override
  void initState() {
    super.initState();
    // Chama o cálculo da média de consumo
    _mediaConsumoFuture = _veiculoController.calcularMediaConsumo(widget.usuarioId, widget.veiculoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Veículo')),
      body: FutureBuilder<double>(
        future: _mediaConsumoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao calcular a média de consumo.'));
          } else if (!snapshot.hasData || snapshot.data == 0.0) {
            return const Center(child: Text('Dados insuficientes para calcular a média.'));
          } else {
            final mediaConsumo = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Média de Consumo: ${mediaConsumo.toStringAsFixed(2)} km/l', style: TextStyle(fontSize: 20)),
                  // Exibe outros detalhes do veículo aqui...
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
