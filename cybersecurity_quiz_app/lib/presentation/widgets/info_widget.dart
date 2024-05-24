import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
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
                    "Info",
                    style: textTheme.headlineLarge,
                  ),
                  const Divider(
                    thickness: 3.0,
                  ),
                  Text(
                    "Made By:",
                    style: textTheme.bodyLarge,
                  ),
                  Text("Joonas Kiuru", style: textTheme.bodyLarge),
                  Text("2024", style: textTheme.bodyLarge)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
