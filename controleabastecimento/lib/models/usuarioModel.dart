class usuarioModel {
  final String id;
  final String email;
  final String senha;
 
  usuarioModel({
    required this.id,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'senha': senha,
    };
  }

  factory usuarioModel.fromMap(String id, Map<String, dynamic> data) {
    return usuarioModel(
      id: id,
      email: data['email'] ?? '',
      senha: data['senha'] ?? '',
    );
  }
}