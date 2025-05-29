import 'package:flutter/material.dart';
import 'generated/app_localizations.dart';

class GameHistoryPage extends StatelessWidget {
  final Future<List<String>> gameHistoryFuture;

  const GameHistoryPage({super.key, required this.gameHistoryFuture});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n?.gameHistoryTitle ?? 'История игр')),
      body: FutureBuilder<List<String>>(
        future: gameHistoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(l10n?.emptyHistory ?? 'История пуста'));
          }
          final history = snapshot.data!;
          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(history[index]),
              );
            },
          );
        },
      ),
    );
  }
}
