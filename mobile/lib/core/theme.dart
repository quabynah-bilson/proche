import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ThemeBuilderX on BuildContext {
  ThemeData get useLightTheme => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xffffffff),
      disabledColor: const Color(0xffe0e0e0),
      colorScheme: useColorScheme(),
      platform: TargetPlatform.iOS,
      textTheme: _textTheme());

  ThemeData get useDarkTheme => ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: useColorScheme(ThemeMode.dark),
      platform: TargetPlatform.iOS,
      textTheme: _textTheme(Colors.white));
}

/// setup color scheme
ColorScheme useColorScheme([ThemeMode mode = ThemeMode.light]) =>
    mode == ThemeMode.light
        ? const ColorScheme.light(
            background: Color(0xffffffff),
            onBackground: Colors.black,
            onPrimary: Color(0xff000000),
            primary: Color(0xffFF6600),
            secondary: Color(0xff2B2921),
            onSecondary: Color(0xffFFE7AB),
            surface: Color(0xffF8F8F9),
            onSurface: Color(0xff2B2723),
            error: Colors.deepOrangeAccent,
            onError: Colors.white,
          )
        : const ColorScheme.dark(
            onBackground: Colors.white,
          );

/// setup font
const _primaryFont = GoogleFonts.dmSans,
    _secondaryFont = GoogleFonts.dmSans;

TextTheme _textTheme([Color textColor = Colors.black]) => TextTheme(
      displayLarge: _primaryFont(
          color: textColor,
          fontSize: 105,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5),
      displayMedium: _primaryFont(
          color: textColor,
          fontSize: 65,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5),
      displaySmall: _primaryFont(
          color: textColor, fontSize: 52, fontWeight: FontWeight.w400),
      headlineMedium: _primaryFont(
          color: textColor,
          fontSize: 37,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25),
      headlineSmall: _primaryFont(
          color: textColor, fontSize: 26, fontWeight: FontWeight.w400),
      titleLarge: _primaryFont(
          color: textColor,
          fontSize: 22,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15),
      titleMedium: _primaryFont(
          color: textColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15),
      titleSmall: _primaryFont(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1),
      bodyLarge: _secondaryFont(
          color: textColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5),
      bodyMedium: _secondaryFont(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25),
      labelLarge: _secondaryFont(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25),
      bodySmall: _secondaryFont(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4),
      labelSmall: _secondaryFont(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5),
    );
