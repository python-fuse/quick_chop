import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.latoTextTheme(),
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade50,
    primary: Colors.pink,
    secondary: Colors.grey.shade100,
    inversePrimary: Colors.grey[900],
    tertiary: Colors.white,
  ),
);
