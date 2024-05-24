import 'package:cybersecurity_quiz_app/logic/bloc/question_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/question_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/question_state.dart';
import 'package:cybersecurity_quiz_app/logic/models/question_model.dart';
import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizForm extends StatefulWidget {
  final Quiz quizData;

  const QuizForm({super.key, required this.quizData});

  @override
  State<StatefulWidget> createState() => _QuizForm();
}

class _QuizForm extends State<QuizForm> {
  List<Question> questions = List.empty();

  @override
  void initState() {
    super.initState();
    questions = widget.quizData.questions;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return questions.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              if (state.currentQuestionIndex! < questions.length) {
                debugPrint("questions length: ${questions.length}");
                debugPrint("Current Index:${state.currentQuestionIndex}");
                var questionIndex = state.currentQuestionIndex!;
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          color: theme.brightness == Brightness.light
                              ? Colors.cyan
                              : Colors.cyan.shade700,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(questions[questionIndex].question,
                                style: textTheme.titleLarge),
                          ),
                        ),
                        Column(children: [
                          ...List.generate(
                              questions[questionIndex].options.length,
                              (optionIndex) {
                            var answerIndex =
                                questions[questionIndex].answerIndex;
                            return ElevatedButton(
                              onPressed: () => context.read<QuestionBloc>().add(
                                  AnswerQuestion(optionIndex, answerIndex)),
                              child: Text(questions[questionIndex]
                                  .options[optionIndex]),
                            );
                          }),
                        ]),
                      ],
                    ),
                  ),
                );
              } else {
                return Text("Quiz Completed!");
              }
            },
          );
  }
}
