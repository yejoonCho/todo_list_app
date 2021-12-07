import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();
  static Color lightPrimaryColor = const Color(0xffbebebe);

  static TextStyle title1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));

  static TextStyle content1 = GoogleFonts.roboto(
    fontSize: 16,
    letterSpacing: 0.5,
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    backgroundColor: Colors.white,
  );
}
