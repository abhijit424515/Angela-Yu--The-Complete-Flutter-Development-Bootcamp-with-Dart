import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

const notes = {
  "1": Colors.red,
  "2": Colors.orange,
  "3": Colors.yellow,
  "4": Colors.green,
  "5": Colors.teal,
  "6": Colors.blue,
  "7": Colors.purple,
};

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  final FocusNode focusNode = FocusNode();

  void playSound(String x) {
    final player = AudioPlayer();
    player.play(AssetSource('note$x.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: notes.entries
                .map(
                  (e) => Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: e.value,
                      ),
                      onPressed: () {
                        playSound(e.key);
                      },
                      child: Text("Note ${e.key}"),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
