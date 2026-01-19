import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_scheme.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: AppColorSchemes.light,
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: AppColorSchemes.dark,
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
  );
}
