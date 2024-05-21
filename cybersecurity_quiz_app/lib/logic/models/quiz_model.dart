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
    List<Question> questions =
        (json['questions'] as List).map((_) => Question.fromJson(_)).toList();
    return Quiz(category: json['category'], questions: questions);
  }
}
