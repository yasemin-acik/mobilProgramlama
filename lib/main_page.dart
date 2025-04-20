import 'package:flutter/material.dart';
import 'skin_test_page.dart'; // Cilt testi sayfası
import 'makeup_suggestions_page.dart'; // Makyaj önerileri sayfası
import 'skin_care_page.dart'; // Cilt bakımı sayfası
import 'profile_page.dart'; // Profil sayfası

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    SkinTestPage(), // Cilt analizi (test) ekranı
    MakeupSuggestionsPage(), // Makyaj önerileri sayfası
    SkinCarePage(), // Cilt bakımı sayfası
    ProfilePage(), // Profil sayfası
  ];

  final List<String> _titles = [
    'Cilt Analizi',
    'Makyaj Önerileri',
    'Cilt Bakımı',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: Colors.pink,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cilt Analizi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brush),
            label: 'Makyaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.spa),
            label: 'Bakım',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}