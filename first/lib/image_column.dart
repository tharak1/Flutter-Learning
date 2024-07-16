import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var num = 1;
  void changeDice() {
    setState(() {
      num = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/$num.png'),
        TextButton(
            onPressed: changeDice,
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            child: const Text(
              "button",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ))
      ],
    );
  }
}
