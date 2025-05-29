import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SyncService {
  static Future<void> syncToFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final box = Hive.box('game_history');
    for (var key in box.keys) {
      final data = Map<String, dynamic>.from(box.get(key));
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('games')
          .doc(key.toString())
          .set(data);
    }
    print("✅ Синхронизация завершена");
  }
}
