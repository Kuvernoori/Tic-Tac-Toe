import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Регистрация по email
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Ошибка при регистрации: $e');
      return null;
    }
  }

  // Вход по email
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Ошибка при входе: $e');
      return null;
    }
  }

  // Вход через Google (Web + Mobile)
  static Future<User?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // Web sign-in
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);
        return userCredential.user;
      } else {
        // Mobile sign-in
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) return null;

        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (e) {
      print('Ошибка при входе через Google: $e');
      return null;
    }
  }

  // Выход
  Future<void> signOut() async {
    await _auth.signOut();
    if (!kIsWeb) {
      await GoogleSignIn().signOut();
    }
  }

  // Слушатель изменений пользователя
  Stream<User?> get userChanges => _auth.userChanges();
}
