import 'package:flutter/material.dart';
import 'package:second/data/questions_data.dart';
import 'package:second/result_details.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAns, required this.moveon});
  final List<String> choosenAns;
  final void Function() moveon;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'question_text': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'opted_answer': choosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(50),
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("hello"),
                const SizedBox(height: 60),
                ResultDetails(getSummaryData()),
                const SizedBox(height: 20),
                OutlinedButton(onPressed: moveon, child: const Text("hi")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
