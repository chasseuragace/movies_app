// static variables for theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeConstants {
  static bool themeModeIsDark = false;

  static TextStyle appFontDark =
      GoogleFonts.montserrat().copyWith(color: Colors.black);
  static TextStyle appFontAccent =
      GoogleFonts.montserrat().copyWith(color: Colors.orange);
  static TextStyle appFontWhite =
      GoogleFonts.montserrat().copyWith(color: Colors.white);

  static TextStyle get appFont => themeModeIsDark ? appFontWhite : appFontDark;

  static get appTheme {
    return ThemeData.dark();
    return themeModeIsDark
        ? ThemeData(
            tabBarTheme: TabBarTheme(labelColor: Colors.white),
            // brightness: Brightness.dark,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            colorScheme:
                ThemeData.light().colorScheme.copyWith(primary: Colors.orange))
        : ThemeData(
            tabBarTheme: TabBarTheme(labelColor: Colors.black),
            // brightness: Brightness.light,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            colorScheme:
                ThemeData.dark().colorScheme.copyWith(primary: Colors.orange));
  }
}

extension p on TextStyle {
  TextStyle withSize(double size) {
    return this.copyWith(fontSize: size);
  }

  TextStyle withWeight({int weight}) {
    if ((weight ?? 10) > 10 || (weight ?? -1) <= 0) {
      return this.copyWith(fontWeight: FontWeight.bold);
    }
    switch (weight) {
      case 1:
        return this.copyWith(fontWeight: FontWeight.w100);
      case 2:
        return this.copyWith(fontWeight: FontWeight.w200);
      case 3:
        return this.copyWith(fontWeight: FontWeight.w300);
      case 4:
        return this.copyWith(fontWeight: FontWeight.w400);
      case 5:
        return this.copyWith(fontWeight: FontWeight.w500);
      case 6:
        return this.copyWith(fontWeight: FontWeight.w600);
      case 7:
        return this.copyWith(fontWeight: FontWeight.w700);
      case 8:
        return this.copyWith(fontWeight: FontWeight.w800);
      case 9:
        return this.copyWith(fontWeight: FontWeight.w900);
      default:
        return this.copyWith(fontWeight: FontWeight.w400);
    }
  }
}
