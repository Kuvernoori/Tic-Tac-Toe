import 'package:flutter/material.dart';

class AuthorsPage extends StatelessWidget {
  const AuthorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Developed by:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Developers: Sanzhar, Alisher', style: TextStyle(fontSize: 16)),
              const Text('UI/UX Designer: Gaukharbek', style: TextStyle(fontSize: 16)),
              const Text('Game Logic Developer: Madiyar', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text(
                'Developed in the scope of the course “Cross-Platform Development”',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text('at Astana IT University', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              const Text(
                'Mentor: Assistant Professor Abzal Kyzyrkanov',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
