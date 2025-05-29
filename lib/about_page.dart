import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'generated/app_localizations.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aboutProject),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(l10n.aboutTheGame),
            Text(
              l10n.gameDescription,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            _buildSectionTitle(l10n.aboutTheTeam),
            _buildPersonRole(l10n.developers, 'Sanzhar, Alisher'),
            _buildPersonRole(l10n.designer, 'Gaukharbek'),
            _buildPersonRole(l10n.logicDeveloper, 'Madiyar'),
            const SizedBox(height: 20),

            Text(
              l10n.courseInfo,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              l10n.mentor,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPersonRole(String role, String names) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(role, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(names)),
        ],
      ),
    );
  }
}
