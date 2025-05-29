import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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

  Future<void> _addToGameHistory(String result) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('gameHistory') ?? [];
    history.add(result);
    await prefs.setStringList('gameHistory', history);
  }

  @override
  void initState() {
    super.initState();
    _loadGameState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => _showGameHistory(context),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  gameOver
                      ? winner != null
                          ? 'Player $winner wins!'
                          : 'It\'s a draw!'
                      : 'Current turn: ${isXTurn ? 'X' : 'O'}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 388,
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
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              board[index],
                              style: TextStyle(
                                fontSize: 40,
                                color: board[index] == 'X' 
                                    ? Theme.of(context).colorScheme.primary 
                                    : Theme.of(context).colorScheme.secondary,
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
                    padding: const EdgeInsets.only(top: 18),
                    child: ElevatedButton(
                      onPressed: _resetGame,
                      child: const Text('Play Again'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showGameHistory(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('gameHistory') ?? [];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Game History')),
          body: ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(history[index]),
            ),
          ),
        ),
      ),
    );
  }

  // ... rest of your methods (_handleTap, _checkWinner, _resetGame, etc.) ...


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

        _addToGameHistory('Player $winner wins');
        _saveGameState();
        return;
      }
    }

    if (!board.contains('')) {
      setState(() {
        gameOver = true; // Draw
      });
      _addToGameHistory('Draw');
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
