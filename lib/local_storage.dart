import 'package:hive/hive.dart';

class LocalStorage {
  static void saveGame(Map<String, dynamic> gameData) {
    final box = Hive.box('game_history');
    final timestamp = DateTime.now().toIso8601String();
    box.put(timestamp, gameData);
  }

  static Map<String, dynamic> loadAllGames() {
    final box = Hive.box('game_history');
    return Map<String, dynamic>.from(box.toMap());
  }

  static void clear() {
    final box = Hive.box('game_history');
    box.clear();
  }
}
