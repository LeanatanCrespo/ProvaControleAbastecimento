class VeiculoModel {
  final String id;
  final String nome;
  final String modelo;
  final int ano;
  final String placa;
  final String usuarioId;

  VeiculoModel({
    required this.id,
    required this.nome,
    required this.modelo,
    required this.ano,
    required this.placa,
    required this.usuarioId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'modelo': modelo,
      'ano': ano,
      'placa': placa,
      'usuarioId': usuarioId,
    };
  }

  factory VeiculoModel.fromMap(String id, Map<String, dynamic> data) {
    return VeiculoModel(
      id: id,
      nome: data['nome'] ?? '',
      modelo: data['modelo'] ?? '',
      ano: data['ano'] ?? 0,
      placa: data['placa'] ?? '',
      usuarioId: data['usuarioId'] ?? '',
    );
  }
}
