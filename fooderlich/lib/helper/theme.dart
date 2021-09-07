import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooderlichTheme {
  static TextTheme lightTextTheme = TextTheme(
      bodyText1: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
      headline1: GoogleFonts.poppins(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: GoogleFonts.poppins(
          fontSize: 21, fontWeight: FontWeight.w700, color: Colors.black),
      headline3: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      headline6: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black));
  static TextTheme darkTextTheme = TextTheme(
      bodyText1: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      headline1: GoogleFonts.poppins(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: GoogleFonts.poppins(
          fontSize: 21, fontWeight: FontWeight.w700, color: Colors.white),
      headline3: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      headline6: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white));

  static ThemeData light() {
    return ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        backgroundColor: Color(0xFFE5E5E5),
        dividerColor: Colors.white54,
        textTheme: lightTextTheme);
  }

  static ThemeData dark() {
    return ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF212121),
        dividerColor: Colors.black12,
        textTheme: darkTextTheme);
  }
}
