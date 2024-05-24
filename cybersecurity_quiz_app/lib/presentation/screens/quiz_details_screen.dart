import 'package:cybersecurity_quiz_app/logic/bloc/question_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:cybersecurity_quiz_app/presentation/widgets/quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizDetailsScreen extends StatelessWidget {
  final Quiz quizData;

  const QuizDetailsScreen({super.key, required this.quizData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (_) => QuestionBloc(),
            child: QuizForm(quizData: quizData)));
  }
}
