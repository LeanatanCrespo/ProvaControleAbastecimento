import 'package:firebase_auth/firebase_auth.dart';

class Autenticacao {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Registrar novo usuário
  Future<User?> registrarUsuario(String email, String senha) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Erro ao registrar usuário: ${e.message}');
      return null;
    }
  }

  // Login de usuário
  Future<User?> loginUsuario(String email, String senha) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Erro ao fazer login: ${e.message}');
      return null;
    }
  }

  // Logout do usuário
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Recuperação de senha
  Future<void> recuperarSenha(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Erro ao enviar e-mail de recuperação de senha: ${e.message}');
    }
  }

  // Obter usuário atual
  User? getUsuarioLog() {
    return _auth.currentUser;
  }
}