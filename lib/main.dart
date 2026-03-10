import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.black,
        ),
      ),
      home: LoginPage());
  }
}
