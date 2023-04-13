import 'package:dacodes_dd3/src/config/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData generateLightTheme() {
  final baseTheme = ThemeData(
    scaffoldBackgroundColor: DD3Colors.background,
    primaryColor: DD3Colors.primary,
    secondaryHeaderColor: DD3Colors.red,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: DD3Colors.primary,
      iconTheme: IconThemeData(color: DD3Colors.primary),
      backgroundColor: DD3Colors.background,
    ),
    colorScheme: const ColorScheme.light(
      primary: DD3Colors.primary,
      onPrimary: DD3Colors.accent,
      secondary: DD3Colors.secondary,
      onSecondary: DD3Colors.accent,
      tertiary: Colors.white,
      onPrimaryContainer: DD3Colors.primary,
      onSecondaryContainer: DD3Colors.secondary,
      onTertiaryContainer: DD3Colors.card,
    ),
  );

  const textColor = DD3Colors.primary;

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(
      baseTheme.textTheme,
    ).copyWith(
      displayLarge: const TextStyle(
        fontSize: 30,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: const TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: const TextStyle(
        fontSize: 15,
        color: textColor,
      ),
      labelMedium: const TextStyle(
        fontSize: 12,
        color: textColor,
      ),
      titleLarge: const TextStyle(
        fontSize: 15,
        color: DD3Colors.background,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        fontSize: 12,
        color: DD3Colors.background,
      ),
      headlineMedium: const TextStyle(
        fontSize: 15,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

ThemeData generateDarkTheme() {
  final baseTheme = ThemeData(
    scaffoldBackgroundColor: DD3Colors.primary,
    primaryColor: DD3Colors.background,
    secondaryHeaderColor: DD3Colors.secondary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: DD3Colors.background,
      iconTheme: IconThemeData(color: DD3Colors.background),
      backgroundColor: DD3Colors.primary,
    ),
    colorScheme: const ColorScheme.light(
      primary: DD3Colors.background,
      onPrimary: DD3Colors.primary,
      secondary: DD3Colors.background,
      onSecondary: DD3Colors.secondary,
      tertiary: Colors.white,
      onPrimaryContainer: DD3Colors.background,
      onSecondaryContainer: DD3Colors.accent,
      onTertiaryContainer: DD3Colors.card,
    ),
  );

  const textColor = DD3Colors.background;

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(
      baseTheme.textTheme,
    ).copyWith(
      displayLarge: const TextStyle(
        fontSize: 30,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: const TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: const TextStyle(
        fontSize: 15,
        color: textColor,
      ),
      labelMedium: const TextStyle(
        fontSize: 12,
        color: textColor,
      ),
      titleLarge: const TextStyle(
        fontSize: 15,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        fontSize: 12,
        color: textColor,
      ),
      headlineMedium: const TextStyle(
        fontSize: 15,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class ThemeDataDD3 {
  static final darkTheme = generateDarkTheme();
  static final lightTheme = generateLightTheme();
}
