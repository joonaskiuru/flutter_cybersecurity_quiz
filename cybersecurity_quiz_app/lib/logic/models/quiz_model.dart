import 'dart:convert';

import 'package:equatable/equatable.dart';

final class Quiz extends Equatable {
  const Quiz({required this.category, required this.questions});

  final String category;
  final Map<String, dynamic> questions;

  @override
  List<Object?> get props => [category, questions];

  factory Quiz.formatQuiz(Map<String, dynamic> json) {
    return Quiz(category: json['category'], questions: json['questions']);
  }

  List<Quiz> fromJsonToList(String jsonData) {
    var jsonList = jsonDecode(jsonData) as List;
    return jsonList.map((quiz) => Quiz.formatQuiz(quiz)).toList();
  }
}
