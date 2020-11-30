import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
  static const _lightFillColor = Colors.black;

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: appColor,
      textTheme: textTheme,
    );
  }

  static ColorScheme appColor = ColorScheme(
    primary: Color(0xFF218f62),
    primaryVariant: Color(0xFF26c585),
    secondary: Color(0xFF5ab5fb),
    secondaryVariant: Color(0xFF44a7c6),
    background: Color(0xFF64768e),
    surface: Color(0xFFffba4a),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
  static TextTheme textTheme = TextTheme(
    headline1:  GoogleFonts.openSans(fontSize: 50,),
    headline3: GoogleFonts.secularOne(fontSize: 30,),
    headline2: GoogleFonts.secularOne(fontWeight: _bold,color:appColor.primary ),
    headline4: TextStyle(fontWeight: _bold, fontSize: 24, letterSpacing: 1.4),
    caption: TextStyle(fontWeight: _bold, fontSize: 16.0),
    headline5: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16.0),
    bodyText1: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 15),
    bodyText2: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Colors.black.withOpacity(0.6)),
    subtitle2: TextStyle(fontWeight: _medium, fontSize: 14.0),
    subtitle1: TextStyle(fontWeight: _medium, fontSize: 16.0),
    overline: TextStyle(fontWeight: _medium, fontSize: 12.0),
    headline6: TextStyle(fontWeight: _bold, fontSize: 16.0),
    button:
        TextStyle(fontWeight: _semiBold, fontSize: 14.0, color: Colors.white),
  );
}
