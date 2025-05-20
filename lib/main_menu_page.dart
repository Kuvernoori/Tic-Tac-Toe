import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'about_page.dart';
import 'settings_page.dart';
import 'game_page.dart';
import 'profile_page.dart';
import 'auth_service.dart'; // добавим для signInWithGoogle
import 'package:firebase_auth/firebase_auth.dart';
import 'loading_screen.dart'; // Add this line

class MainMenuPage extends StatefulWidget {
  final User? user;
  const MainMenuPage({super.key, this.user});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (mounted) {
        setState(() {
          _user = user;
          // Reset selected index when auth state changes
          _selectedIndex = 0;
        });
      }
    });
  }

  List<Widget> get _pages {
    return [
      const GamePage(),
      const AboutPage(),
      if (_user != null) const SettingsPage(),
      if (_user != null) const ProfilePage(),
    ];
  }

  List<BottomNavigationBarItem> get _navItems {
    final l10n = AppLocalizations.of(context);
    return [
      BottomNavigationBarItem(icon: const Icon(Icons.videogame_asset), label: l10n?.game ?? 'Game'),
      BottomNavigationBarItem(icon: const Icon(Icons.info), label: l10n?.aboutProject ?? 'About'),
      if (_user != null) BottomNavigationBarItem(icon: const Icon(Icons.settings), label: l10n?.settings ?? 'Settings'),
      if (_user != null) BottomNavigationBarItem(icon: const Icon(Icons.person), label: l10n?.profile ?? 'Profile'),
    ];
  }

  void _onItemTapped(int index) {
    // Ensure index is valid
    final validIndex = index.clamp(0, _navItems.length - 1);
    setState(() {
      _selectedIndex = validIndex;
    });
  }

  
 // Inside _MainMenuPageState class in MainMenuPage.dart

Future<void> _handleSignIn() async {
  // Show loading screen
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const LoadingScreen(),
      fullscreenDialog: true, // Makes it appear as a modal
    ),
  );

  try {
    User? signedInUser = await AuthService.signInWithGoogle();
    
    // Pop loading screen (whether success or failure)
    Navigator.of(context).pop(); 
    
    if (signedInUser != null) {
      setState(() {
        _user = signedInUser; // Update UI
      });
    } else {
      // Show error if login failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-in failed')),
      );
    }
  } catch (e) {
    Navigator.of(context).pop(); // Ensure loading screen is dismissed
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.mainMenu ?? 'Main Menu'),
        actions: _user == null
            ? [
                IconButton(
                  icon: const Icon(Icons.login),
                  tooltip: l10n?.signIn ?? 'Sign In',
                  onPressed: _handleSignIn,
                ),
              ]
            : null,
      ),
      body: Column(
        children: [
          if (_user == null)
            Container(
              width: double.infinity,
              color: Colors.amber,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    l10n?.guestModeBanner ?? 'You are in guest mode. Please sign in to access all features.',
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: _handleSignIn,
                    icon: const Icon(Icons.login),
                    label: Text(l10n?.signIn ?? 'Sign In'),
                  ),
                ],
              ),
            ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _navItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
