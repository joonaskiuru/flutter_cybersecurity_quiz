import 'package:cybersecurity_quiz_app/logic/bloc/theme_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/theme_state.dart';
import 'package:cybersecurity_quiz_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.theme,
            home: const Scaffold(
              body: HomeScreen(title: "Cyber Security Quiz App"),
            ),
          );
        },
      ),
    ),
  );
}
