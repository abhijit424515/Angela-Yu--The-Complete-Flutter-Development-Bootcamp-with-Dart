import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

// class DicePage extends StatelessWidget {
//   const DicePage({super.key});

// }

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 3;
  int rightDiceNum = 2;

  void changeDieFaces() {
    setState(() {
      leftDiceNum = 1 + Random().nextInt(6);
      rightDiceNum = 1 + Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () => changeDieFaces(),
              child: Image.asset("images/dice$leftDiceNum.png"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => changeDieFaces(),
              child: Image.asset("images/dice$rightDiceNum.png"),
            ),
          ),
        ],
      ),
    );
  }
}
