import 'dart:async';

import 'package:cybersecurity_quiz_app/logic/bloc/question_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/question_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionState()) {
    on<AnswerQuestion>(_answerQuestion);
  }

  FutureOr<void> _answerQuestion(
      AnswerQuestion event, Emitter<QuestionState> emit) {}
}
