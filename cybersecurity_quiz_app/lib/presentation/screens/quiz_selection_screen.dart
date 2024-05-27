import 'package:cybersecurity_quiz_app/logic/bloc/quiz_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_event.dart';
import 'package:cybersecurity_quiz_app/presentation/widgets/quiz_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizSelectionScreen extends StatelessWidget {
  const QuizSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => QuizBloc()..add(LoadQuizzes()),
        child: const QuizList(),
      ),
    );
  }
}
