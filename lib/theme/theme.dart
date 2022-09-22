import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData nDark = dark();

ThemeData dark() {
  return ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.black,
      canvasColor: Colors.transparent,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        headlineSmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24),
        bodyMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18),
        bodySmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 14),
      ),
      primaryTextTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.blueGrey,
            fontFamily: GoogleFonts.poppins().fontFamily),
        headlineMedium: TextStyle(
            color: Colors.blueGrey,
            fontFamily: GoogleFonts.poppins().fontFamily),
        displaySmall: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.poppins().fontFamily),
        bodyLarge: TextStyle(
            color: Colors.blueGrey,
            fontFamily: GoogleFonts.poppins().fontFamily),
        headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color.fromARGB(255, 39, 1, 3),
      ));
}

final ThemeData deluxaDark = deluxadark();

ThemeData deluxadark() {
  return ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff1f271b),
          foregroundColor: Color(0xfff4d35e)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.black45,
      canvasColor: Colors.transparent,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: const Color(0xfff4d35e),
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        headlineSmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24),
        bodyMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18),
        bodySmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 14),
        displayMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.normal,
            color: const Color(0xfff4d35e),
            fontSize: 12),
      ),
      primaryTextTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.blueGrey,
            fontFamily: GoogleFonts.poppins().fontFamily),
        headlineMedium: TextStyle(
            color: Colors.blueGrey,
            fontFamily: GoogleFonts.poppins().fontFamily),
        displaySmall: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.poppins().fontFamily),
        bodyLarge: TextStyle(
            color: Colors.blueGrey,
            fontFamily: GoogleFonts.poppins().fontFamily),
        headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromARGB(255, 39, 1, 3),
          onPrimary: const Color(0xfff4d35e),
          onSecondary: const Color(0xff1f271b),
          onSurface: const Color.fromARGB(255, 146, 124, 42)));
}
