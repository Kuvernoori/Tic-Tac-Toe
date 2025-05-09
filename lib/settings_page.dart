import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            Text(l10n!.selectLanguage, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _LanguageButton(locale: const Locale('en'), label: l10n.languageEnglish, color: Colors.blue),
            _LanguageButton(locale: const Locale('ru'), label: l10n.languageRussian, color: Colors.green),
            _LanguageButton(locale: const Locale('kk'), label: l10n.languageKazakh, color: Colors.orange),
            const SizedBox(height: 32),
            Text(l10n.selectTheme, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => MyApp.setThemeMode(context, ThemeMode.light),
              child: Text(l10n.lightTheme),
            ),
            ElevatedButton(
              onPressed: () => MyApp.setThemeMode(context, ThemeMode.dark),
              child: Text(l10n.darkTheme),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final Locale locale;
  final String label;
  final Color color;

  const _LanguageButton({
    required this.locale,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () => MyApp.setLocale(context, locale),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(200, 50),
        ),
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
