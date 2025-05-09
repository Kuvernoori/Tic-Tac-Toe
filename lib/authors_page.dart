import 'package:flutter/material.dart';

class AuthorsPage extends StatelessWidget {
  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Developed by:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Developers: Sanzhar, Alisher', style: TextStyle(fontSize: 16)),
              Text('UI/UX Designer: Gaukharbek', style: TextStyle(fontSize: 16)),
              Text('Game Logic Developer: Madiyar', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text(
                'Developed in the scope of the course “Cross-Platform Development”',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('at Astana IT University', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text(
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
