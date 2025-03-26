import 'package:flutter/material.dart';
import 'about_page.dart';
import 'authors_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  void _startGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutPage()),
    );
  }

  void _showAuthors(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthorsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _startGame(context),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('About Game'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showAuthors(context),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Authors'),
            ),
          ],
        ),
      ),
    );
  }
}
