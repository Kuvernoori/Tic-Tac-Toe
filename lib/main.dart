import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'main_menu_page.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD61Lg3PsFEUoyHV90nhRmN0otZe1zKXFk',
        appId: '1:356017861010:web:9fce887f8c9d9dffc8914b',
        messagingSenderId: '356017861010',
        projectId: 'tictac-45488',
        authDomain: 'tictac-45488.firebaseapp.com',
        storageBucket: 'tictac-45488.firebasestorage.app',
        measurementId: 'G-BE2W58H95L',
      ),
    );
  } else {
    await Firebase.initializeApp(); // Инициализация Firebase
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }

  static void setThemeMode(BuildContext context, ThemeMode mode) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setThemeMode(mode);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');
  ThemeMode _themeMode = ThemeMode.light;
  User? _user;

  @override
  void initState() {
    super.initState();
    _initializeUserSettings();
    FirebaseAuth.instance.userChanges().listen((user) {
      setState(() {
        _user = user;
      });
      if (user != null) {
        _loadUserPreferences(user);
      } else {
        setState(() {
          _locale = const Locale('en');
          _themeMode = ThemeMode.light;
        });
      }
    });
  }

  // Инициализация настроек пользователя при старте
  Future<void> _initializeUserSettings() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
      _loadUserPreferences(user);
    } else {
      setState(() {
        _user = null;
      });
    }
  }

  // Загрузка предпочтений пользователя из Firestore
  Future<void> _loadUserPreferences(User user) async {
    DocumentSnapshot userPreferences = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    if (userPreferences.exists) {
      var preferences = userPreferences.data() as Map<String, dynamic>;
      setState(() {
        _locale = Locale(preferences['language'] ?? 'en');
        _themeMode = preferences['theme'] == 'dark' ? ThemeMode.dark : ThemeMode.light;
      });
    }
  }

  // Сохранение настроек пользователя в Firestore
  Future<void> _saveUserPreferences() async {
    if (_user != null) {
      await FirebaseFirestore.instance.collection('users').doc(_user!.uid).set({
        'language': _locale.languageCode,
        'theme': _themeMode == ThemeMode.dark ? 'dark' : 'light',
      }, SetOptions(merge: true));
    }
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
    _saveUserPreferences(); // Сохранить предпочтение языка
  }

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
    _saveUserPreferences(); // Сохранить предпочтение темы
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      locale: _locale,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('kk'),
      ],
      home: MainMenuPage(user: _user),
    );
  }
}