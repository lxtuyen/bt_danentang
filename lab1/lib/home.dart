import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "I Am Rich",
              style: TextStyle(fontSize: 24),
            ),
            Image.asset(
              'assets/OIP.jfif',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}