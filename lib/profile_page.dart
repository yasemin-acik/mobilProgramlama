import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key}); // Key parametresi eklendi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Sayfası'),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text(
          'Profil Sayfası',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}