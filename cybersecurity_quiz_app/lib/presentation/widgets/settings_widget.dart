import 'package:cybersecurity_quiz_app/logic/bloc/theme_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidget();
}

class _SettingsWidget extends State<SettingsWidget> {
  void changeTheme() {
    context.read<ThemeBloc>().add(ChangeTheme());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: width * 0.9,
          height: height * 0.9,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Settings",
                    style: textTheme.headlineLarge,
                  ),
                  Divider(
                    thickness: 3.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Change theme:",
                      style: textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.4,
                    child: Card(
                      color: Colors.blueGrey,
                      child: IconButton(
                        icon: Icon(theme.brightness == Brightness.light
                            ? Icons.dark_mode
                            : Icons.light_mode),
                        onPressed: changeTheme,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
