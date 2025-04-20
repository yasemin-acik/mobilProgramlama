import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ana Sayfa')),
      body: Center(
        child: Text(
          'Hoş geldin, $userName!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}