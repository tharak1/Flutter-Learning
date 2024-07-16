import 'package:flutter/material.dart';

class ResultDetails extends StatelessWidget {
  const ResultDetails(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(((data['question_index'] as int) + 1).toString()),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['question_text'] as String),
                        const SizedBox(height: 5),
                        Text(data['correct_answer'] as String),
                        Text(data['opted_answer'] as String),
                        const SizedBox(height: 40),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
