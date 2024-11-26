class AbastecimentoModel {
  final String? id;
  final double litro;
  final double quilometragem;
  final DateTime data;
  final String veiculoId;

  AbastecimentoModel({
    this.id,
    required this.litro,
    required this.quilometragem,
    required this.data,
    required this.veiculoId,
  });

  Map<String, dynamic> toMap() {
    return {
      'litro': litro,
      'quilometragem': quilometragem,
      'data': data.toIso8601String(),
      'veiculoId': veiculoId,
    };
  }

  factory AbastecimentoModel.fromMap(String id, Map<String, dynamic> data) {
    return AbastecimentoModel(
      id: id,
      litro: data['litro'] ?? 0.0,
      quilometragem: data['quilometragem'] ?? 0.0,
      data: DateTime.parse(data['data'] ?? DateTime.now().toIso8601String()),
      veiculoId: data['veiculoId'] ?? '',
    );
  }
}

