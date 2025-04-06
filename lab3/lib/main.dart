import 'package:flutter/material.dart';
import 'package:lab3/GradientContainer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          Colors.purple,
          Colors.deepPurple,
        ),
      ),
    );
  }
}