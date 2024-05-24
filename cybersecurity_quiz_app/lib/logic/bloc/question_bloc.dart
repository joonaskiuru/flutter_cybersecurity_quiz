import 'dart:async';

import 'package:cybersecurity_quiz_app/logic/bloc/question_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/question_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc()
      : super(const QuestionState(
            currentQuestionIndex: 0, isQuizCompleted: false, points: 0)) {
    on<AnswerQuestion>(_answerQuestion);
  }

  FutureOr<void> _answerQuestion(
      AnswerQuestion event, Emitter<QuestionState> emit) {
    if (event.answerIndex == event.correctAnswerIndex) {
      emit(state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex! + 1,
          points: state.points! + 1));
    } else {
      emit(state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex! + 1));
    }
  }
}
