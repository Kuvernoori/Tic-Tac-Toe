import 'package:flutter/material.dart';

class ScrollableContent extends StatelessWidget {
  const ScrollableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game History'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Game ${index + 1}: Player X won',
                  style: TextStyle(fontSize: constraints.maxWidth < 500 ? 14 : 16),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
