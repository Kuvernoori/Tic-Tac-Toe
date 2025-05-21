import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/main_menu_page.dart';
import 'auth_service.dart';
import 'settings_page.dart'; 
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  String? selectedLanguage;
  ThemeMode? selectedTheme;
  bool initialized = false;

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  late List<_SearchItem> _items;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized) {
      selectedLanguage = Localizations.localeOf(context).languageCode;
      final brightness = Theme.of(context).brightness;
      selectedTheme = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
      initialized = true;

      final l10n = AppLocalizations.of(context)!;
      _items = [
        _SearchItem(
          keyword: 'language',
          localizedKeyword: l10n.language.toLowerCase(),
          label: l10n.language,
        ),
        _SearchItem(
          keyword: 'theme',
          localizedKeyword: l10n.theme.toLowerCase(),
          label: l10n.theme,
        ),
      ];
    }
  }

  void _changeLanguage(String? lang) {
    if (lang != null) {
      setState(() {
        selectedLanguage = lang;
      });
      MyApp.setLocale(context, Locale(lang));
    }
  }

  void _changeTheme(ThemeMode? mode) {
    if (mode != null) {
      setState(() {
        selectedTheme = mode;
      });
      MyApp.setThemeMode(context, mode);
    }
  }

  void _logout() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    await authService.signOut();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainMenuPage(user: null)),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (user == null) {
      return const Center(
        child: Text('You are in guest mode. Please sign in to access profile.'),
      );
    }

    final filteredItems = _items
        .where((item) =>
            item.localizedKeyword.contains(_searchQuery.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email: ${user!.email}', style: const TextStyle(fontSize: 18)),

          const SizedBox(height: 20),

          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: l10n?.searchSettings ?? 'Search settings...',
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value.toLowerCase();
              });
            },
          ),

          const SizedBox(height: 10),

          if (_searchQuery.isNotEmpty && filteredItems.isNotEmpty)
            ...filteredItems.map((item) => ListTile(
                  title: Text(item.label),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  },
                )),

          const Spacer(),

          ElevatedButton(
            onPressed: _logout,
            child: Text(l10n?.logout ?? 'Log out'),
          ),
        ],
      ),
    );
  }
}

class _SearchItem {
  final String keyword;
  final String localizedKeyword;
  final String label;

  _SearchItem({
    required this.keyword,
    required this.localizedKeyword,
    required this.label,
  });
}
