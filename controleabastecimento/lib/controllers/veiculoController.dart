import 'package:controleabastecimento/config/veiculoAutenticacao.dart';
import 'package:controleabastecimento/models/veiculoModel.dart';
import '../models/abastecimentoModel.dart';
import '../config/abastecimentoAutenticacao.dart';

class VeiculoController {
  final VeiculoService _service = VeiculoService();
  final AbastecimentoAutenticacao _abastecimentoAutenticacao = AbastecimentoAutenticacao();

  // Função para adicionar um veículo
  Future<void> addVeiculo(VeiculoModel veiculo, String usuarioId) async {
    await _service.registrarVeiculo(veiculo, usuarioId);
  }

  // Função para buscar os veículos
  Future<List<VeiculoModel>> fetchVeiculos(String usuarioId) async {
    return await _service.getVeiculos(usuarioId);
  }

  // Função para atualizar os dados do veículo
  Future<void> updateVeiculo(String usuarioId, String veiculoId, VeiculoModel veiculo) async {
    await _service.updateVeiculo(usuarioId, veiculoId, veiculo);
  }

  // Função para deletar o veículo
  Future<void> deleteVeiculo(String usuarioId, String veiculoId) async {
    await _service.deleteVeiculo(usuarioId, veiculoId);
  }

  // Função para calcular a média de consumo do veículo
  Future<double> calcularMediaConsumo(String usuarioId, String veiculoId) async {
    // Buscar os abastecimentos do veículo
    List<AbastecimentoModel> abastecimentos = await _abastecimentoAutenticacao.getAbastecimentos(usuarioId, veiculoId);

    if (abastecimentos.length < 2) {
      // Não há dados suficientes para calcular a média
      return 0.0;
    }

    double totalConsumo = 0.0;
    double totalLitros = 0.0;

    // Para cada abastecimento (exceto o primeiro)
    for (int i = 1; i < abastecimentos.length; i++) {
      final quilometragemAnterior = abastecimentos[i - 1].quilometragem;
      final quilometragemAtual = abastecimentos[i].quilometragem;
      final litros = abastecimentos[i].litro;

      // Calcular o consumo entre o abastecimento anterior e o atual
      if (quilometragemAtual > quilometragemAnterior && litros > 0) {
        totalConsumo += quilometragemAtual - quilometragemAnterior;
        totalLitros += litros;
      }
    }

    if (totalLitros == 0) return 0.0;

    return totalConsumo / totalLitros;  // Retorna a média
  }
}

