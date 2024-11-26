import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/abastecimentoModel.dart';

class AbastecimentoAutenticacao {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obter coleção de abastecimentos de um veículo
  CollectionReference _abastecimentoCollection(String usuarioId, String veiculoId) {
    return _firestore
        .collection('usuarios')
        .doc(usuarioId)
        .collection('veiculos')
        .doc(veiculoId)
        .collection('abastecimentos');
  }

  // Adicionar novo abastecimento
  Future<void> registrarAbastecimento(
      String usuarioId, String veiculoId, AbastecimentoModel abastecimento) async {
    await _abastecimentoCollection(usuarioId, veiculoId).add(abastecimento.toMap());
  }

  // Obter lista de abastecimentos (Snapshot para tempo real)
  Stream<List<AbastecimentoModel>> streamAbastecimentos(String usuarioId, String veiculoId) {
    return _abastecimentoCollection(usuarioId, veiculoId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AbastecimentoModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<List<AbastecimentoModel>> getAbastecimentos(String usuarioId, String veiculoId) async {
    try {
      // Busca os abastecimentos de um usuário e veículo específicos no Firestore
      final querySnapshot = await _firestore
          .collection('abastecimentos')
          .where('usuarioId', isEqualTo: usuarioId)
          .where('veiculoId', isEqualTo: veiculoId)
          .orderBy('data', descending: true) // Ordena pelos mais recentes
          .get();

      // Converte os dados para uma lista de objetos AbastecimentoModel
      List<AbastecimentoModel> abastecimentos = querySnapshot.docs.map((doc) {
        return AbastecimentoModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      return abastecimentos;
    } catch (e) {
      print("Erro ao buscar abastecimentos: $e");
      return [];
    }
  }
}
