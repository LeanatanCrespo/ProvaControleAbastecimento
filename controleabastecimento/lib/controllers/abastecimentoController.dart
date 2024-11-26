import '../config/abastecimentoAutenticacao.dart';
import '../models/abastecimentoModel.dart';

class AbastecimentoController {
  final AbastecimentoAutenticacao _abastecimentoAutenticacao = AbastecimentoAutenticacao();

  Future<void> addAbastecimento(
      String usuarioId, String veiculoId, AbastecimentoModel abastecimento) async {
    await _abastecimentoAutenticacao.registrarAbastecimento(usuarioId, veiculoId, abastecimento);
  }

  Stream<List<AbastecimentoModel>> fetchAbastecimentos(String usuarioId, String veiculoId) {
    return _abastecimentoAutenticacao.streamAbastecimentos(usuarioId, veiculoId);
  }
}

