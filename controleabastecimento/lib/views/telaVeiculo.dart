import 'package:controleabastecimento/views/telaDetalhesVeiculos.dart';
import 'package:flutter/material.dart';
import '../controllers/veiculoController.dart';
import '../models/veiculoModel.dart';
import '../views/telaAdicionarVeiculo.dart';


class VeiculoView extends StatefulWidget {
  final String usuarioId;

  const VeiculoView({required this.usuarioId, Key? key}) : super(key: key);

  @override
  State<VeiculoView> createState() => _VeiculoViewState();
}

class _VeiculoViewState extends State<VeiculoView> {
  final VeiculoController _controller = VeiculoController();
  late Future<List<VeiculoModel>> _veiculosFuture;

  @override
  void initState() {
    super.initState();
    _veiculosFuture = _controller.fetchVeiculos(widget.usuarioId);
  }

  void _refreshVeiculos() {
    setState(() {
      _veiculosFuture = _controller.fetchVeiculos(widget.usuarioId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Veículos')),
      body: FutureBuilder<List<VeiculoModel>>(
        future: _veiculosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar veículos.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum veículo cadastrado.'));
          } else {
            final veiculos = snapshot.data!;
            return ListView.builder(
              itemCount: veiculos.length,
              itemBuilder: (context, index) {
                final veiculo = veiculos[index];
                return ListTile(
                  title: Text(veiculo.nome),
                  subtitle: Text('${veiculo.modelo} - ${veiculo.ano}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesVeiculoView(
                          usuarioId: widget.usuarioId,
                          veiculoId: veiculo.id,
                        ),
                      ),
                    ).then((_) => _refreshVeiculos());
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Color.fromARGB(255, 54, 138, 57)),
                    onPressed: () async {
                      await _controller.deleteVeiculo(widget.usuarioId, veiculo.id);
                      _refreshVeiculos();
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarVeiculoView(usuarioId: widget.usuarioId),
            ),
          ).then((_) => _refreshVeiculos());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
