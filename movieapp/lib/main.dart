import 'package:flutter/material.dart';
import 'package:movieapp/screens/home_screen.dart';
import 'package:movieapp/services/api_service.dart';

void main() {
  ApiService().getPopularMovides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
