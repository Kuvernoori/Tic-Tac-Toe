import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n!.settings),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.selectLanguage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            _LanguageButton(
              locale: const Locale('en'),
              label: l10n.languageEnglish,
              color: Colors.blue,
            ),
            const SizedBox(height: 15),
            _LanguageButton(
              locale: const Locale('ru'),
              label: l10n.languageRussian,
              color: Colors.green,
            ),
            const SizedBox(height: 15),
            _LanguageButton(
              locale: const Locale('kk'),
              label: l10n.languageKazakh,
              color: Colors.orange,
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
    return ElevatedButton(
      onPressed: () => MyApp.setLocale(context, locale),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}