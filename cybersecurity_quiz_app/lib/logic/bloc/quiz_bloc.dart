import 'dart:convert';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:bloc/bloc.dart';
import 'package:cybersecurity_quiz_app/logic/models/quiz_model.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:flutter/services.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on<LoadQuizzes>(_onLoadQuizzes);
  }

  Future<void> _onLoadQuizzes(
      LoadQuizzes event, Emitter<QuizState> emit) async {
    try {
      // Fetch data from json file.
      var quizJson =
          await rootBundle.loadString("assets/database/quiz_data.json");

      if (event.filter.isNotEmpty) {
        emit(state.copyWith(
          status: QuizStatus.success,
          quizzes: [],
        ));
      }

      // Refactor json data to list of quizzes.
      List<Quiz> quizzes = fromJsonToList(quizJson);
      List<Quiz> filteredQuizzes = quizzes
          .where(
            (element) => element.category
                .toLowerCase()
                .contains(event.filter.toLowerCase()),
          )
          .toList();
      emit(state.copyWith(
        status: QuizStatus.success,
        quizzes: List.of(state.quizzes)..addAll(filteredQuizzes),
      ));
    } catch (e) {
      emit(state.copyWith(status: QuizStatus.failure));
    }
  }

  // Create a list of quizzes from json data
  List<Quiz> fromJsonToList(String jsonData) {
    var jsonList = jsonDecode(jsonData);
    var quizzes = jsonList['quiz']['categories'] as List;
    return quizzes.map((_) => Quiz.formatQuiz(_)).toList();
  }
}
