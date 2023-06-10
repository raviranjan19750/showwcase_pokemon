import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/main.dart';

class AppTheme {
  AppTheme._privateConstructor();

  static ThemeData get main {
    return ThemeData.light().copyWith(
      primaryColor: const Color(0xff0071C2),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        // backgroundColor: const Color(0xffFFFFFF),
        titleTextStyle: GoogleFonts.mulish().copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 1,
        ),
      ),
      primaryColorDark: const Color(0xff002F51),
      primaryColorLight: const Color(0xff338DCE),
      secondaryHeaderColor: const Color(0xff423264),
      colorScheme: const ColorScheme(
        // required colors scheme
        brightness: Brightness.light,
        primary: Color(0xff0071C2),
        onPrimary: Color(0xff338DCE),
        secondary: Color(0xff9E77ED),
        onSecondary: Color(0xffE1D5F9),
        error: Color(0xffF04438),
        onError: Color(0xffF79009),
        background: Color(0xffFAFBFB),
        onBackground: Color(0xffFAFBFB),
        surface: Color(0xffFFFFFF),
        onSurface: Color(0xffFFFFFF),
        onTertiary: Color(0xff140F29),

        //non required colors scheme

        tertiary: Color(0xFF625E70),
        inversePrimary: Color(0xff12B76A),
        errorContainer: Color(0xff651D18),
        primaryContainer: Color(0xff0071C2),
        // secondaryContainer:

        inverseSurface: Color(0xffA6A6A6),
        surfaceVariant: Color(0xff000000),

        secondaryContainer: Color(0xff423264),

        //tertiary: Color(0xff07DF7A),

        tertiaryContainer: Color(0xff433F54),
      ),
      scaffoldBackgroundColor: const Color(0xffFFFFFF),
      primaryTextTheme: _textTheme,
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconSize: MaterialStatePropertyAll(10),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.only(left: 16.0, right: 0.0),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xff0071C2),
      ),
    );
  }
  // 625E70

  static ThemeData get mainDark {
    return ThemeData.dark().copyWith(
      primaryColor: const Color(0xff0071C2),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black54,
        titleTextStyle: GoogleFonts.mulish().copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 1,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff0071C2),
        ),
      ),
      textTheme: _darkTextTheme,
      primaryColorDark: const Color(0xff002F51),
      primaryColorLight: const Color(0xff338DCE),
      secondaryHeaderColor: const Color(0xff423264),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff0071C2),
        primaryContainer: Color(0xff002F51),
        inversePrimary: Color(0xffFFFFFF),
        inverseSurface: Color(0xffFFFFFF), //A6A6A6
        surfaceVariant: Color(0xffFFFFFF),
        onPrimary: Color(0xff92D6B6),
        secondary: Color(0xff9E77ED),
        secondaryContainer: Color(0xff423264),
        onSecondary: Color(0xffF5F1FD),
        error: Color(0xffF04438),
        errorContainer: Color(0xff651D18),
        onError: Color(0xffFAC5C1),
        tertiary: Color(0xff07DF7A),
        onTertiary: Color(0xffF79009),
        tertiaryContainer: Color(0xff140F29),
        background: Color(0xff242424),
        onBackground: Color(0xff242424),
        surface: Color(0xff000000),
        onSurface: Color(0xff000000),
      ),
      scaffoldBackgroundColor: Colors.black54,
      primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconSize: MaterialStatePropertyAll(10),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.only(left: 16.0, right: 0.0),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xffFFFFFF),
      ),
    );
  }

  static TextTheme get _textTheme {
    return GoogleFonts.mulishTextTheme().copyWith(
      // H-1
      displayLarge: _tStyle(96, FontWeight.w800, Colors.black87, 106),
      // H-2
      displayMedium: _tStyle(64, FontWeight.w800, Colors.black87, 106),
      // H-3
      displaySmall: _tStyle(48, FontWeight.w800, Colors.black87, 106),
      // H-4
      headlineLarge: _tStyle(40, FontWeight.w800, Colors.black87, 53),
      // H-5
      headlineMedium: _tStyle(36, FontWeight.w800, Colors.black87, 40),
      // H-6
      headlineSmall: _tStyle(32, FontWeight.w800, Colors.black87, 24),
      // Title-3
      titleLarge: _tStyle(24, FontWeight.w800, Colors.black87, 22),
      // Title-2
      titleMedium: _tStyle(20, FontWeight.w800, Colors.black87, 24),
      // Title-1
      titleSmall: _tStyle(18, FontWeight.w800, Colors.black87, 24),
      // Body
      bodyLarge: _tStyle(14, FontWeight.w800, Colors.black87, 24),
      bodyMedium: _tStyle(14, FontWeight.w800, Colors.black87, 21),
      bodySmall: _tStyle(14, FontWeight.w800, Colors.black87, 21),
      // Label
      labelLarge: _tStyle(12, FontWeight.w800, Colors.black87, 12),
      labelMedium: _tStyle(12, FontWeight.w800, Colors.black87, 12),
      labelSmall: _tStyle(12, FontWeight.w800, Colors.black87, 12),
    );
  }

  static TextTheme get _darkTextTheme {
    return GoogleFonts.mulishTextTheme().copyWith(
      // H-1
      displayLarge: _tStyle(96, FontWeight.w800, Colors.white, 106),
      // H-2
      displayMedium: _tStyle(64, FontWeight.w800, Colors.white, 106),
      // H-3
      displaySmall: _tStyle(48, FontWeight.w800, Colors.white, 106),
      // H-4
      headlineLarge: _tStyle(40, FontWeight.w800, Colors.white, 53),
      // H-5
      headlineMedium: _tStyle(36, FontWeight.w800, Colors.white, 40),
      // H-6
      headlineSmall: _tStyle(32, FontWeight.w800, Colors.white, 24),
      // Title-3
      titleLarge: _tStyle(24, FontWeight.w800, Colors.white, 22),
      // Title-2
      titleMedium: _tStyle(20, FontWeight.w800, Colors.white, 24),
      // Title-1
      titleSmall: _tStyle(18, FontWeight.w800, Colors.white, 24),
      // Body
      bodyLarge: _tStyle(14, FontWeight.w800, Colors.white, 24),
      bodyMedium: _tStyle(14, FontWeight.w800, Colors.white, 21),
      bodySmall: _tStyle(14, FontWeight.w800, Colors.white, 21),
      // Label
      labelLarge: _tStyle(12, FontWeight.w800, Colors.white, 12),
      labelMedium: _tStyle(12, FontWeight.w800, Colors.white, 12),
      labelSmall: _tStyle(12, FontWeight.w800, Colors.white, 12),
    );
  }

  static TextStyle _tStyle(
          double size, FontWeight weight, Color color, double height) =>
      TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      );
}

TextTheme get textTheme =>
    Theme.of(MyApp.navigatorKey.currentContext!).textTheme;
