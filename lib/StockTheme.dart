import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StockTheme {


  static TextTheme darkTextTheme = TextTheme(

    headline1: GoogleFonts.darkerGrotesque(
      fontSize: 36.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),

    headline2: GoogleFonts.darkerGrotesque(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),

    headline3: GoogleFonts.darkerGrotesque(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(210, 210, 210, 1),
    ),

    bodyText1: GoogleFonts.darkerGrotesque(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(210, 210, 210, 1),
    ),

    bodyText2: GoogleFonts.darkerGrotesque(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );



  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: primaryDark,

      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: primaryDark,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: selectedYellow,
      ),
      textTheme: darkTextTheme,
    );
  }
}
const primaryDark = const Color.fromRGBO(23, 23, 52, 1);
const primary = const Color(0xFF1E1E3D);
const selectedYellow = const Color(0xFFFFB802);
const textBackgroundGrey = const Color.fromRGBO(47, 52, 68, 1);