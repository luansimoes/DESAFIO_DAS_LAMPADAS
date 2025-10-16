import 'package:flutter/material.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(const DesafioDasLampadasApp());
}

class DesafioDasLampadasApp extends StatelessWidget {
  const DesafioDasLampadasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio das Lâmpadas',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[200],
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}
