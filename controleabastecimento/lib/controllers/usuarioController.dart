import 'package:firebase_auth/firebase_auth.dart';
import 'package:controleabastecimento/config/autenticacao.dart';

class UsuarioController {
  final Autenticacao _autenticacao = Autenticacao();

  // Registrar novo usuário
  Future<User?> registrar(String email, String password) async {
    try {
      return await _autenticacao.registrarUsuario(email, password);
    } catch (e) {
      print('Erro ao registrar: $e');
      return null;
    }
  }

  // Login do usuário
  Future<User?> login(String email, String password) async {
    try {
      return await _autenticacao.loginUsuario(email, password);
    } catch (e) {
      print('Erro ao logar: $e');
      return null;
    }
  }

  // Recuperação de senha
  Future<void> recuperarSenha(String email) async {
    try {
      await _autenticacao.recuperarSenha(email);
    } catch (e) {
      print('Erro na recuperação de senha: $e');
    }
  }

  // Logout
  Future<void> logout() async {
    await _autenticacao.logout();
  }

  // Atualizar nome de usuário
  Future<bool> atualizarNome(String novoNome) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updateDisplayName(novoNome);
        await user.reload(); // Recarrega o usuário para refletir as mudanças
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Erro ao atualizar nome: $e');
      return false;
    }
  }

  // Atualizar e-mail do usuário
  Future<bool> atualizarEmail(String novoEmail) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updateEmail(novoEmail);
        await user.reload(); // Recarrega o usuário para refletir as mudanças
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Erro ao atualizar e-mail: $e');
      return false;
    }
  }

  // Atualizar senha do usuário
  Future<bool> atualizarSenha(String novaSenha) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updatePassword(novaSenha);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Erro ao atualizar senha: $e');
      return false;
    }
  }
}

