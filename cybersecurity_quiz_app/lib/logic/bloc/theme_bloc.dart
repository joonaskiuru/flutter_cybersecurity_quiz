import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/theme_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/theme_state.dart';
import 'package:flutter/material.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: ThemeData.light())) {
    on<ChangeTheme>(_changeTheme);
  }

  FutureOr<void> _changeTheme(ChangeTheme event, Emitter emit) {
    final changedTheme =
        state.theme == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    emit(ThemeState(theme: changedTheme));
  }
}
