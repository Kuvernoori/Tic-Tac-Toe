import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'interactive_widgets.dart';
import 'game_page.dart';
import 'about_page.dart';
import 'authors_page.dart';
import 'scrollable_content.dart';
import 'settings_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.mainMenu ?? 'Main Menu'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Кнопка Interactive Widgets
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InteractiveWidgets(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 50),
                  ),
                  child: Text(l10n?.goToInteractiveWidgets ?? 'Interactive Widgets'),
                ),
              ),
              
              // Кнопка Start Game
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 50),
                  ),
                  child: Text(l10n?.startGame ?? 'Start Game'),
                ),
              ),
              
              // Кнопка About Project
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 50),
                  ),
                  child: Text(l10n?.aboutProject ?? 'About Project'),
                ),
              ),
              
              // Кнопка Authors
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthorsPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 50),
                  ),
                  child: Text(l10n?.authors ?? 'Authors'),
                ),
              ),
              
              // Кнопка Game History
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScrollableContent(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 50),
                  ),
                  child: Text(l10n?.gameHistory ?? 'Game History'),
                ),
              ),
              
              // Кнопка Settings
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 50),
                  ),
                  child: Text(l10n?.settings ?? 'Settings'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}