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
      // todo define  for others
    }
  }
}
