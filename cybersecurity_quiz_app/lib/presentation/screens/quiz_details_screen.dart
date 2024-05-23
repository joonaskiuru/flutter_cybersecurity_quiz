import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:cybersecurity_quiz_app/presentation/widgets/quiz_form.dart';
import 'package:flutter/material.dart';

class QuizDetailsScreen extends StatelessWidget {
  final Quiz quizData;

  const QuizDetailsScreen({super.key, required this.quizData});

  @override
  Widget build(BuildContext context) {
    return QuizForm(quizData: quizData);
  }
}
