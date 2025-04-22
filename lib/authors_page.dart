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
            children: const [
              Text(
                'Developed by:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Developers: Sanzhar, Alisher',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'UI/UX Designer: Gaukharbek',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Game Logic Developer: Madiyar',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Developed in the scope of the course “Cross-Platform Development”',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'at Astana IT University',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Mentor (Teacher): Assistant Professor Abzal Kyzyrkanov',
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
