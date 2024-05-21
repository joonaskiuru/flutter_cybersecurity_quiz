import 'package:cybersecurity_quiz_app/logic/bloc/theme_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  void changeTheme() {
    context.read<ThemeBloc>().add(ChangeTheme());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ElevatedButton(
      onPressed: changeTheme,
      child: const Text("Toggle Theme"),
    ));
  }
}
