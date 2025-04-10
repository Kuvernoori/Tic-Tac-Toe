import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Language',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),

            // Кнопки для смены языка
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, const Locale('en'));
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, const Locale('ru'));
              },
              child: const Text('Русский'),
            ),
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, const Locale('kk'));
              },
              child: const Text('Қазақша'),
            ),
          ],
        ),
      ),
    );
  }

  // Функция для изменения языка
  void _changeLanguage(BuildContext context, Locale locale) {
    MyApp.setLocale(context, locale);
  }
}
