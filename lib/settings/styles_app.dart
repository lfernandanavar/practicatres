import 'package:flutter/material.dart';

class StylesApp {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        useMaterial3: true,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Color.fromARGB(255, 207, 184, 238), //Texto del boton de login y keep sing 
            )); 
  }
  static ThemeData darkTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
      useMaterial3: true,
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Color.fromARGB(255, 142, 217, 252)
      )
    );
  }
}