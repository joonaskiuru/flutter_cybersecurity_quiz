import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:equatable/equatable.dart';

enum QuizStatus { initial, success, failure }

final class QuizState extends Equatable {
  const QuizState(
      {this.status = QuizStatus.initial,
      this.quizzes = const <Quiz>[],
});

  final QuizStatus status;
  final List<Quiz> quizzes;

  QuizState copyWith({
    QuizStatus? status,
    List<Quiz>? quizzes,

  }) {
    return QuizState(
      status: status ?? this.status,
      quizzes: quizzes ?? this.quizzes,

    );
  }

  @override
  List<Object> get props => [status, quizzes];
}
