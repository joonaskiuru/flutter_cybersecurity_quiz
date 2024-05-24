import 'package:cybersecurity_quiz_app/logic/bloc/theme_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/theme_event.dart';
import 'package:cybersecurity_quiz_app/presentation/widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SettingsWidget());
  }
}
