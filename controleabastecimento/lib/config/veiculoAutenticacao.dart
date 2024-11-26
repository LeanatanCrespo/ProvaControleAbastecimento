import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/veiculoModel.dart';

class VeiculoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _veiculoCollection => _firestore.collection('veiculos');

  Future<void> registrarVeiculo(VeiculoModel veiculo, String usuarioId) async {
    await _veiculoCollection
        .doc(usuarioId)
        .collection('usuario_veiculos')
        .add(veiculo.toMap());
  }

  Future<List<VeiculoModel>> getVeiculos(String usuarioId) async {
    QuerySnapshot snapshot =
        await _veiculoCollection.doc(usuarioId).collection('usuario_veiculos').get();

    return snapshot.docs
        .map((doc) => VeiculoModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateVeiculo(String usuarioId, String veiculoId, VeiculoModel veiculo) async {
    await _veiculoCollection
        .doc(usuarioId)
        .collection('usuario_veiculos')
        .doc(veiculoId)
        .update(veiculo.toMap());
  }

  Future<void> deleteVeiculo(String usuarioId, String veiculoId) async {
    await _veiculoCollection
        .doc(usuarioId)
        .collection('usuario_veiculos')
        .doc(veiculoId)
        .delete();
  }
}

