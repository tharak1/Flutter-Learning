import 'package:flutter/material.dart';

import 'package:meals/screens/tab.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Tabs(),
    ),
  );
}
