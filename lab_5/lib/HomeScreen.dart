import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lab_5/ButtonModel.dart';
import 'package:lab_5/XylophoneButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AudioPlayer player;
  final buttons = allButtons;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:
              buttons
                  .map(
                    (button) => XylophoneButton(
                      color: button.color,
                      onPressed: () async {
                        await player.play(
                          AssetSource('${button.audioName}.wav'),
                        );
                      },
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
