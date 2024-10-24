import 'package:flutter/material.dart';
import 'package:quize_app/data/data.dart';
import 'package:quize_app/quiz_question.dart';
import 'package:quize_app/quiz_result.dart';
import 'package:quize_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-question';
    });
  }

  void reStartQuize() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'quiz-question';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "quiz-result";
      });
    }
  }

  @override
  Widget build(context) {
    Widget switchwidget = StartScreen(switchScreen);

    if (activeScreen == 'quiz-question') {
      switchwidget = QuizQuestion(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'quiz-result') {
      switchwidget = QuizResult(
        chosenAnswer: selectedAnswers,
        reStartQuiz: reStartQuize,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 42, 25, 156),
                Color.fromARGB(255, 121, 66, 148),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: switchwidget,
        ),
      ),
    );
  }
}
