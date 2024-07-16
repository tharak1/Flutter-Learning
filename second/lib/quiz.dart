import 'package:flutter/material.dart';
import 'package:second/first_page.dart';
import 'package:second/questions.dart';
import 'package:second/data/questions_data.dart';
import 'package:second/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> opted = [];
  var currentScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      currentScreen = 'questions_screen';
    });
  }

  void selectedAnswers(String answer) {
    opted.add(answer);
    if (opted.length == questions.length) {
      setState(() {
        currentScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    opted = [];
    setState(() {
      currentScreen = 'start_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = FrontPage(switchScreen);

    if (currentScreen == 'questions_screen') {
      screenWidget = Questions(
        onSelected: selectedAnswers,
      );
    }

    if (currentScreen == 'start_screen') {
      screenWidget = FrontPage(switchScreen);
    }

    if (currentScreen == 'results_screen') {
      screenWidget = ResultScreen(
        choosenAns: opted,
        moveon: restartQuiz,
      );
    }

    return screenWidget;
  }
}
