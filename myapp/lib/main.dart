import 'package:flutter/material.dart';

import 'package:myapp/screens/start_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: const StartScreen(),
  ));
}
