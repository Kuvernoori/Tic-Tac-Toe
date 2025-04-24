import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'about_page.dart';
import 'settings_page.dart';
import 'game_page.dart'; // <-- добавим

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    GamePage(), // <- Заменили на GamePage
    AboutPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.mainMenu ?? 'Main Menu'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: l10n?.game ?? 'Game'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: l10n?.aboutProject ?? 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: l10n?.settings ?? 'Settings'),

        ],
      ),
    );
  }
}
