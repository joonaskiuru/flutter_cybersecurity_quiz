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
  final List<Quiz>? quizzes;
  final bool hasReachedMax;
  const QuizLoaded({this.quizzes, this.hasReachedMax = true});

  QuizLoaded copyWith({List<Quiz>? quizzes, bool? hasReachedMax}) {
    return QuizLoaded(
        quizzes: quizzes ?? this.quizzes,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}
