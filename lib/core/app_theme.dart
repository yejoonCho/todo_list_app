import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();
  static TextStyle title = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xffbebebe),
    backgroundColor: Colors.white,
  );
}
