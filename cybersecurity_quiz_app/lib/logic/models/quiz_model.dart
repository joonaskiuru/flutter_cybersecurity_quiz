import 'dart:convert';

import 'package:cybersecurity_quiz_app/logic/models/question_model.dart';
import 'package:equatable/equatable.dart';

final class Quiz extends Equatable {
  const Quiz({required this.category, required this.questions});

  // Category as String
  final String category;

  // All the questions in a map
  final List<Question> questions;

  @override
  List<Object?> get props => [category, questions];

  factory Quiz.formatQuiz(Map<String, dynamic> json) {
    print("category: ${json['category']}");
    List<Question> questions =
        (json['questions'] as List).map((_) => Question.fromJson(_)).toList();
    return Quiz(category: json['category'], questions: questions);
  }

  // Create a list of quizzes from json data
  static List<Quiz> fromJsonToList(String jsonData) {
    var jsonList = jsonDecode(jsonData);
    var quizzes = jsonList['quiz']['categories'] as List;
    return quizzes.map((_) => Quiz.formatQuiz(_)).toList();
  }
}
