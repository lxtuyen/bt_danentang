import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent.shade400,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("MAGIC 8 BALL"),
            ],
          ),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        body: const MagicBallPage(),
      ),
    );
  }
}

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({super.key});

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  List<String> possibleAnswers = [];
  int possibleAnswersLength = 0;
  String answer = "";

  _MagicBallPageState() {
    _magicBallAnswers();
  }

  Future<void> _magicBallAnswers() async {
    final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final answersList = assetManifest
        .listAssets()
        .where((path) => path.startsWith("assets"))
        .toList();

    setState(() {
      possibleAnswers = answersList;
      possibleAnswersLength = possibleAnswers.length;
    });
  }

  void randomAnswer() {
    int answerIndex = Random().nextInt(possibleAnswersLength);

    setState(() {
      answer = possibleAnswers[answerIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    while (possibleAnswers.isEmpty) {
      return _buildLoading();
    }

    randomAnswer();

    return MagicLayout(answer: answer, randomAnswer: randomAnswer);
  }

  Widget _buildLoading() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class MagicLayout extends StatelessWidget {
  final VoidCallback randomAnswer;
  final String answer;

  const MagicLayout(
      {required this.answer, required this.randomAnswer, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMagicBall();
  }

  Widget _buildMagicBall() {
    return InkWell(
      onTap: randomAnswer,
      splashColor: Colors.blueAccent,
      child: MagicBallImage(
        imagePath: answer,
      ),
    );
  }
}

class MagicBallImage extends StatelessWidget {
  final String imagePath;
  const MagicBallImage({required this.imagePath, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}