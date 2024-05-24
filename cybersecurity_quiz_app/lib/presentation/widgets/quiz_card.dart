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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final themeCyan = theme.brightness == Brightness.light
        ? Colors.cyan
        : Colors.cyan.shade700;

    final themeYellow = theme.brightness == Brightness.light
        ? Colors.yellow
        : Colors.grey.shade700;

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
                  child: SizedBox(
                    height: height * 0.7,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            color: themeCyan,
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
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.grey.withOpacity(0.5);
                                      }
                                      return null; // Use the component's default.
                                    },
                                  ),
                                ),
                                onPressed: () => context
                                    .read<QuestionBloc>()
                                    .add(AnswerQuestion(
                                        optionIndex, answerIndex)),
                                child: Text(questions[questionIndex]
                                    .options[optionIndex]),
                              );
                            }),
                          ]),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                      child: SizedBox(
                    height: height * 0.5,
                    width: width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            color: themeCyan,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    widget.quizData.category,
                                    style: textTheme.headlineMedium,
                                  ),
                                  Text(
                                    "Quiz Completed!",
                                    style: textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Points:",
                                style: textTheme.headlineSmall,
                              ),
                              Text(
                                  "${state.points.toString()} / ${questions.length}",
                                  style: textTheme.headlineSmall),
                            ],
                          ),
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: themeYellow),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              label: Text('Back to quiz selection',
                                  style: textTheme.bodyLarge)),
                        ],
                      ),
                    ),
                  )),
                ));
              }
            },
          );
  }
}
