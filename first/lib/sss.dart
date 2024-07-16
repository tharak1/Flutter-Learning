import 'package:flutter/material.dart';
import 'package:first/image_column.dart';

class Sss extends StatelessWidget {
  const Sss({super.key});
  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: const Center(child: DiceRoller()),
    );
  }
}
