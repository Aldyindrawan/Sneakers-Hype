import 'package:flutter/material.dart';
import 'screens/splash screen_page.dart'; // Ganti ke splash screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Mulai dari splash screen
    );
  }
}
