import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
sealed class QuizState extends Equatable {
  final List<Quiz> quizzes;
  final bool hasReachedMax;
  const QuizState({this.quizzes = const <Quiz>[], this.hasReachedMax = true});

  @override
  List<Object> get props => [quizzes, hasReachedMax];
}

final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizError extends QuizState {
  final String errorMessage;
  const QuizError(this.errorMessage);
}

final class QuizLoaded extends QuizState {
  const QuizLoaded(
      {super.quizzes = const <Quiz>[], super.hasReachedMax = true});

  QuizLoaded copyWith({List<Quiz>? quizzes, bool? hasReachedMax}) {
    return QuizLoaded(
        quizzes: quizzes ?? this.quizzes,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
