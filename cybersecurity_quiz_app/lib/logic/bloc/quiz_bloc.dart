import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<LoadQuizzes>(_onLoadQuizzes);
  }
}

Future<void> _onLoadQuizzes(LoadQuizzes event, Emitter<QuizState> emit) async {
  emit(QuizLoading());
  try {
    var quiz_json = await rootBundle.loadString("../database/quiz_data.json");
    var quizList = jsonDecode(quiz_json);

    
  } catch (e) {
    emit(const QuizError("Error loading quiz data."));
  }
}
