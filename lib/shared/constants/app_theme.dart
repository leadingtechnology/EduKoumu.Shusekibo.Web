import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const int light = 0;
  static const int dark = 1;

  // Define font size.
  static const double smallFontSize = 18.0;
  static const double normalFontSize = 22.0;

  // Define colors
  static const Color normalColor = Colors.green;

  // Define theme data - light mode.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'NotoSansJP',
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2D6B27),
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: const Color(0xffffffff),
    navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme:
            IconThemeData(color: Color(0xFF2D4E27), opacity: 1, size: 24),
        unselectedIconTheme:
            IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
        backgroundColor: Color(0xffffffff),
        elevation: 3,
        selectedLabelTextStyle: TextStyle(color: Color(0xFF2D4E27)),
        unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
    colorScheme: const ColorScheme.light(
        primary: Color(0xFF2D6B27),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFAFF49F),
        secondary: Color(0xFF53634E),
        secondaryContainer: Color(0xFFD6E8CD),
        onSecondary: Color(0xFFFFFFFF),
        error: Color(0xFFBA1B1B),
        errorContainer: Color(0xFFFFDAD4),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410001),
        surface: Color(0xFFFCFCF6),
        background: Color(0xFFFCFCF6),
        onBackground: Color(0xFF1A1C19)),
  );

  // Define theme data - dark mode.
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'NotoSansJP',
  );
}
