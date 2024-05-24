import 'package:equatable/equatable.dart';

class QuestionState extends Equatable {
  final int? currentQuestionIndex;
  final bool? isQuizCompleted;
  final int? points;

  const QuestionState(
      {required this.currentQuestionIndex,
      required this.isQuizCompleted,
      required this.points});

  @override
  List<Object?> get props => [currentQuestionIndex, isQuizCompleted, points];

  QuestionState copyWith(
      {int? currentQuestionIndex, bool? isQuizCompleted, int? points}) {
    return QuestionState(
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        isQuizCompleted: isQuizCompleted ?? this.isQuizCompleted,
        points: points ?? this.points);
  }
}
