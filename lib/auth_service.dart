import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Регистрация
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Ошибка при регистрации: $e');
      return null;
    }
  }

  // Логин
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Ошибка при входе: $e');
      return null;
    }
  }

  // Выход
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Слушатель изменений состояния пользователя
  Stream<User?> get userChanges => _auth.userChanges();
}
