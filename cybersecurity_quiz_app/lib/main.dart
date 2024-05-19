import 'package:cybersecurity_quiz_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: HomeScreen(title: "Cyber Security Quiz App"),
      ),
    ),
  );
}
