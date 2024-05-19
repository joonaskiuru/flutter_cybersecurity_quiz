import 'package:bloc/bloc.dart';
import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
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
    var quizJson =
        await rootBundle.loadString("../assets/database/quiz_data.json");
    List<Quiz> quizzes = Quiz.fromJsonToList(quizJson);
    emit(QuizLoaded(quizzes: quizzes, hasReachedMax: false));
  } catch (e) {
    emit(const QuizError("Error loading quiz data."));
  }
}
