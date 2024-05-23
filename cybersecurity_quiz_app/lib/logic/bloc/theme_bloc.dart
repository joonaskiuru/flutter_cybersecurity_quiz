import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/theme_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: ThemeData.light())) {
    on<InitTheme>(_setInitialTheme);
    on<ChangeTheme>(_changeTheme);
  }

  FutureOr<void> _setInitialTheme(
      InitTheme event, Emitter<ThemeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final lightTheme = prefs.getBool('lightTheme') ?? true;
    final initTheme = lightTheme ? ThemeData.dark() : ThemeData.light();

    emit(ThemeState(theme: initTheme));
  }

  FutureOr<void> _changeTheme(ChangeTheme event, Emitter emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool lightTheme = prefs.getBool('lightTheme') ?? true;

    final changedTheme = lightTheme ? ThemeData.dark() : ThemeData.light();

    await prefs.setBool('lightTheme', !lightTheme);
    emit(ThemeState(theme: changedTheme));
  }
}
