// static variables for theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeConstants {
  static bool themeModeIsDark = false;

  static TextStyle appFontDark =
      GoogleFonts.montserrat().copyWith(color: Colors.black);
  static TextStyle appFontAccent =
      GoogleFonts.montserrat().copyWith(color: Colors.black);
  static TextStyle appFontWhite =
      GoogleFonts.montserrat().copyWith(color: Colors.white);

  static get appTheme => themeModeIsDark
      ? ThemeData(
          accentColor: Colors.orange,
        )
      : ThemeData(
          accentColor: Colors.orange,
        );
}

extension p on TextStyle {
  TextStyle withSize(double size) {
    return this.copyWith(fontSize: size);
  }

  TextStyle withWeight(int weight) {
// todo size can be form 1 to 9,
// use switch case to select appropriate fontweight wrt weight paramater
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
      // todo define  for others
    }
  }
}
