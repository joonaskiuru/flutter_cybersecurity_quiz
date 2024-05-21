import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizListItem extends StatelessWidget {
  final Quiz quiz;

  const QuizListItem({required this.quiz, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          color: Colors.cyan,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.1,
                  child: Card(
                    color: Colors.yellow,
                    child: ListTile(
                      title: Text(quiz.category, style: textTheme.titleLarge),
                      subtitle: Text(
                        "Questions: ${quiz.questions.length}",
                        style: textTheme.titleMedium,
                      ),
                      isThreeLine: true,
                      dense: true,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: height * 0.1,
                      width: width * 0.8,
                      child: ElevatedButton.icon(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Text("Quiz Details")),
                            );
                          },
                          label: Text(
                            "PLAY",
                            style: textTheme.titleLarge,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
