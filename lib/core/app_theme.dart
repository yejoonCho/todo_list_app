import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xffbebebe),
    backgroundColor: Colors.white,
  );

  static final textTheme = TextTheme(
    headline1: GoogleFonts.roboto(
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  );
}
