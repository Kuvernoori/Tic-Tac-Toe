import 'package:flutter/material.dart';
import 'about_page.dart';
import 'authors_page.dart';
import 'scrollable_content.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  void _openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
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
              onPressed: () => _openPage(context, const AboutPage()),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('About Game'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _openPage(context, const AuthorsPage()),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Authors'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _openPage(context, const ScrollableContent()),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Game History'),
            ),
          ],
        ),
      ),
    );
  }
}
