import 'package:flutter/material.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // _QuizPageState createState() => _QuizPageState();
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<bool> answers = [false, true, true];

  int qIndex = 0;
  bool gameOver = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                gameOver ? "Game Over\n Score: $score" : questions[qIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        gameOver
            ? Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: ElevatedButton(
                    child: const Text("Restart the game"),
                    onPressed: () {
                      setState(() {
                        qIndex = 0;
                        score = 0;
                        scoreKeeper = [];
                        gameOver = false;
                      });
                    },
                  ),
                ),
              )
            : Container(),
        gameOver
            ? Container()
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.green),
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (answers[qIndex]) {
                          score++;
                        }
                        scoreKeeper.add(
                          answers[qIndex]
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                        );
                        if (scoreKeeper.length == questions.length) {
                          gameOver = true;
                        } else {
                          qIndex++;
                        }
                      });
                    },
                  ),
                ),
              ),
        gameOver
            ? Container()
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (!answers[qIndex]) {
                          score++;
                        }
                        scoreKeeper.add(
                          answers[qIndex]
                              ? const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                        );
                        if (scoreKeeper.length == questions.length) {
                          gameOver = true;
                        } else {
                          qIndex++;
                        }
                      });
                    },
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
