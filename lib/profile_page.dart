import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/main_menu_page.dart';
import 'auth_service.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'generated/app_localizations.dart';

import 'main.dart'; // For MyApp.setLocale and setThemeMode

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
  
  // Clear navigation stack and go to main menu (which will now show guest UI)
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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email: ${user!.email}', style: const TextStyle(fontSize: 18)),

         
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: _logout,
            child: Text(l10n?.logout ?? 'Log out'),
          ),
        ],
      ),
    );
  }
}
