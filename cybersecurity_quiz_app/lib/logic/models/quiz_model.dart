import 'dart:convert';

import 'package:equatable/equatable.dart';

final class Quiz extends Equatable {
  const Quiz({required this.category, required this.questions});

  // Category as String
  final String category;

  // All the questions in a map
  final Map<String, dynamic> questions;

  @override
  List<Object?> get props => [category, questions];

  factory Quiz.formatQuiz(Map<String, dynamic> json) {
    return Quiz(category: json['category'], questions: json['questions']);
  }

  // Create a list of quizzes from json data
  static List<Quiz> fromJsonToList(String jsonData) {
    var jsonList = jsonDecode(jsonData) as List;
    return jsonList.map((quiz) => Quiz.formatQuiz(quiz)).toList();
  }
}
