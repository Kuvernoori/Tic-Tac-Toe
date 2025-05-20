import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Registered user: ${userCredential.user?.displayName ?? userCredential.user?.email}");
      return userCredential.user;
    } catch (e) {
      print('Registration error: $e');
      return null;
    }
  }


  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Signed in user: ${userCredential.user?.displayName ?? userCredential.user?.email}");
      return userCredential.user;
    } catch (e) {
      print('Sign-in error: $e');
      return null;
    }
  }

  static Future<User?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);
        User? user = userCredential.user;
        if (user != null) {
          print("Web Google sign-in: ${user.displayName}, ${user.email}");
        }
        return user;
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          print("Google sign-in aborted by user.");
          return null;
        }

        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;
        if (user != null) {
          print("Mobile Google sign-in: ${user.displayName}, ${user.email}, ${user.photoURL}");
        }
        return user;
      }
    } catch (e) {
      print('Google sign-in error: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      if (!kIsWeb) {
        await GoogleSignIn().signOut();
      }
      print("User signed out.");
    } catch (e) {
      print("Sign-out error: $e");
    }
  }

  Stream<User?> get userChanges => _auth.userChanges();
}
