import 'package:cybersecurity_quiz_app/logic/models/question_model.dart';
import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizForm extends StatefulWidget {
  final Quiz quizData;

  const QuizForm({super.key, required this.quizData});

  @override
  State<StatefulWidget> createState() => _QuizForm();
}

class _QuizForm extends State<QuizForm> {
  final _formKey = GlobalKey<FormState>();

  int _questionIndex = 0;
  int points = 0;
  List<Question> questions = List.empty();

  @override
  void initState() {
    super.initState();
    questions = widget.quizData.questions;
  }

  void answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: questions.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Column(
                  children: questions
                      .map(
                        (question) => ListTile(
                          title: Text(question.question),
                        ),
                      )
                      .toList()),
            ),
    );
  }
}
