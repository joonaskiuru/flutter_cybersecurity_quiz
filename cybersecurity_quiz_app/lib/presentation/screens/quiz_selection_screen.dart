import 'package:cybersecurity_quiz_app/logic/bloc/quiz_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_state.dart';
import 'package:cybersecurity_quiz_app/presentation/widgets/quiz_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizSelection extends StatelessWidget {
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
