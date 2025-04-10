import 'package:flutter/material.dart';
import 'interactive_widgets.dart'; // Экран с интерактивными виджетами
import 'game_page.dart'; // Экран с игрой
import 'about_page.dart'; // Экран о проекте
import 'authors_page.dart'; // Экран об авторах
import 'scrollable_content.dart'; // Экран с историей игр
import 'settings_page.dart'; // Экран настроек

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Первая кнопка для перехода на экран с интерактивными виджетами
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InteractiveWidgets(),
                  ),
                );
              },
              child: const Text('Go to Interactive Widgets'),
            ),
            const SizedBox(height: 20), // Отступ между кнопками

            // Вторая кнопка для перехода на страницу игры
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GamePage(),
                  ),
                );
              },
              child: const Text('Start Game'),
            ),
            const SizedBox(height: 20), // Отступ между кнопками

            // Кнопка для перехода на страницу "About"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
              child: const Text('About Project'),
            ),
            const SizedBox(height: 20), // Отступ между кнопками

            // Кнопка для перехода на страницу авторов
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthorsPage(),
                  ),
                );
              },
              child: const Text('Authors'),
            ),
            const SizedBox(height: 20), // Отступ между кнопками

            // Кнопка для перехода на страницу "Game History"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScrollableContent(),
                  ),
                );
              },
              child: const Text('Game History'),
            ),
            const SizedBox(height: 20), // Отступ между кнопками

            // Кнопка для перехода на экран настроек (смена языка)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
