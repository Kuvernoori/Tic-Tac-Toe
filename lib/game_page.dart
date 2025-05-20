import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const GamePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> board = List.filled(9, '');
  bool isXTurn = true;
  String? winner;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _loadGameState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(
  gameOver
      ? winner != null
          ? l10n?.playerWins(winner!) ?? 'Player $winner wins!'
          : l10n?.draw ?? 'It\'s a draw!'
      : l10n?.currentTurn(isXTurn ? 'X' : 'O') ?? 'Current turn: ${isXTurn ? 'X' : 'O'}',
  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),
              const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _handleTap(index),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              board[index],
                              style: TextStyle(
                                fontSize: 40,
                                color: board[index] == 'X' ? Colors.blue : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (gameOver)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: _resetGame,
                      child: Text(l10n?.playAgain ?? 'Play Again'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleTap(int index) {
    if (board[index].isNotEmpty || gameOver) return;

    setState(() {
      board[index] = isXTurn ? 'X' : 'O';
      _checkWinner();
      if (!gameOver) isXTurn = !isXTurn;
    });

    _saveGameState();
  }

  void _checkWinner() {
    const winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
      [0, 4, 8], [2, 4, 6],            // diagonals
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]].isNotEmpty &&
          board[combo[0]] == board[combo[1]] &&
          board[combo[1]] == board[combo[2]]) {
        setState(() {
          winner = board[combo[0]];
          gameOver = true;
        });
        _saveGameState();
        return;
      }
    }

    if (!board.contains('')) {
      setState(() {
        gameOver = true; // Draw
      });
      _saveGameState();
    }
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      isXTurn = true;
      winner = null;
      gameOver = false;
    });

    _saveGameState();
  }

  Future<void> _saveGameState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('board', jsonEncode(board));
    await prefs.setBool('isXTurn', isXTurn);
    await prefs.setBool('gameOver', gameOver);
    await prefs.setString('winner', winner ?? '');
  }

  Future<void> _loadGameState() async {
    final prefs = await SharedPreferences.getInstance();
    final savedBoard = prefs.getString('board');
    if (savedBoard != null) {
      setState(() {
        board = List<String>.from(jsonDecode(savedBoard));
        isXTurn = prefs.getBool('isXTurn') ?? true;
        gameOver = prefs.getBool('gameOver') ?? false;
        final savedWinner = prefs.getString('winner') ?? '';
        winner = savedWinner.isEmpty ? null : savedWinner;
      });
    }
  }
}