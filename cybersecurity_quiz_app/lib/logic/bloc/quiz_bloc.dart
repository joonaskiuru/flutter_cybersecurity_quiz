import 'package:bloc/bloc.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
