import 'package:meta/meta.dart';
import 'quiz_bloc.dart';
import 'package:equatable/equatable.dart';

@immutable
sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizLoaded extends QuizState {
  final List<Quiz> quizzes;

  @override
  List<Object> get props => [this.quizzes];
}
