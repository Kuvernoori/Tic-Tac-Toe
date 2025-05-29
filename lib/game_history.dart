import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameHistoryEntry {
  final DateTime timestamp;
  final String winner;
  final List<String> board;

  GameHistoryEntry({
    required this.timestamp,
    required this.winner,
    required this.board,
  });

  factory GameHistoryEntry.fromMap(Map<String, dynamic> map) {
    return GameHistoryEntry(
      timestamp: DateTime.parse(map['timestamp']),
      winner: map['winner'],
      board: List<String>.from(map['board']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'winner': winner,
      'board': board,
    };
  }
}

Future<List<GameHistoryEntry>> loadHistoryFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('game_history');
  if (jsonString == null) return [];

  final List<dynamic> decoded = jsonDecode(jsonString);
  return decoded.map((item) => GameHistoryEntry.fromMap(item)).toList();
}

class GameHistoryScreen extends StatelessWidget {
  const GameHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('История игр')),
      body: FutureBuilder<List<GameHistoryEntry>>(
        future: loadHistoryFromPrefs(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final history = snapshot.data!;
          if (history.isEmpty) {
            return const Center(child: Text('История пуста'));
          }

          return ListView(
            children: history.map(buildHistoryTile).toList(),
          );
        },
      ),
    );
  }

  Widget buildHistoryTile(GameHistoryEntry entry) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Время: ${entry.timestamp}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('Победитель: ${entry.winner}'),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: List.generate(9, (i) {
                return Center(
                  child: Text(
                    entry.board[i].isEmpty ? '-' : entry.board[i],
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
