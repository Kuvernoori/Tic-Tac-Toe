import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
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
  }

  @override
  Widget build(BuildContext context) {
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
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
