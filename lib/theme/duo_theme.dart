import 'package:flutter/material.dart';

class DuoColors {
  static const Color duoGreen = Color(0xFF7B61FF); // Blurple
  static const Color duoGreenDark = Color(0xFF634ACC);
  static const Color duoBlue = Color(0xFF9D7BFF); // Lighter Blurple
  static const Color duoBlueDark = Color(0xFF8254FF);
  static const Color duoOrange = Color(0xFFFF6B6B); // Soft Red/Coral
  static const Color duoOrangeDark = Color(0xFFE55B5B);
  static const Color duoRed = Color(0xFFFF4B4B);
  static const Color duoRedDark = Color(0xFFD33131);
  static const Color duoCardBorder = Color(0xFFE0E0E0);
  static const Color duoCardBorderDark = Color(0xFF2D2D2D);
  static const Color duoTextMain = Color(0xFF2D2D2D);
  static const Color duoTextMainDark = Colors.white;
  static const Color duoGray = Color(0xFF8E8E93);
  static const Color duoGrayDark = Color(0xFFB0B0B0);
}

class DuoTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: DuoColors.duoGreen,
      primary: DuoColors.duoGreen,
      secondary: DuoColors.duoBlue,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: DuoColors.duoTextMain,
        fontSize: 20,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.5,
      ),
      iconTheme: IconThemeData(color: DuoColors.duoGray),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: DuoColors.duoCardBorder, width: 2),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: DuoColors.duoGreen.withOpacity(0.1),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(color: DuoColors.duoGreen, fontWeight: FontWeight.w900);
        }
        return const TextStyle(color: DuoColors.duoGray, fontWeight: FontWeight.bold);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: DuoColors.duoGreen);
        }
        return const IconThemeData(color: DuoColors.duoGray);
      }),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: DuoColors.duoTextMain),
      bodyMedium: TextStyle(color: DuoColors.duoTextMain),
      titleLarge: TextStyle(color: DuoColors.duoTextMain, fontWeight: FontWeight.w900),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0F0F12),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: DuoColors.duoGreen,
      primary: DuoColors.duoGreen,
      secondary: DuoColors.duoBlue,
      surface: const Color(0xFF1C1C1E),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0F0F12),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: DuoColors.duoTextMainDark,
        fontSize: 20,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.5,
      ),
      iconTheme: IconThemeData(color: DuoColors.duoGrayDark),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1C1C1E),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: DuoColors.duoCardBorderDark, width: 2),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF0F0F12),
      indicatorColor: DuoColors.duoGreen.withOpacity(0.2),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(color: DuoColors.duoGreen, fontWeight: FontWeight.w900);
        }
        return const TextStyle(color: DuoColors.duoGrayDark, fontWeight: FontWeight.bold);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: DuoColors.duoGreen);
        }
        return const IconThemeData(color: DuoColors.duoGrayDark);
      }),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: DuoColors.duoTextMainDark),
      bodyMedium: TextStyle(color: DuoColors.duoTextMainDark),
      titleLarge: TextStyle(color: DuoColors.duoTextMainDark, fontWeight: FontWeight.w900),
    ),
  );
}
