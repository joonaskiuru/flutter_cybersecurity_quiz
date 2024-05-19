import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizError extends QuizState {
  final String errorMessage;
  const QuizError(this.errorMessage);
}

final class QuizLoaded extends QuizState {
  final List<Quiz> quizzes;
  const QuizLoaded(this.quizzes);
}
