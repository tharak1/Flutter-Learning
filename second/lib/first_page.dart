import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'This is a quiz app !!',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                  onPressed: startQuiz,
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(15),
                    side: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  child: const Text(
                    "Let's Go",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
