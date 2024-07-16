import 'package:flutter/material.dart';
import 'package:second/data/questions_data.dart';
import 'package:second/options.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelected});

  final void Function(String answer) onSelected;
  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  void onChoose(String answer) {
    widget.onSelected(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SizedBox(
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentQuestion.text,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ...currentQuestion.getShuffledAnswers().map((options) {
                    return OptionButton(
                        options: options,
                        onTap: () {
                          onChoose(options);
                        });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
