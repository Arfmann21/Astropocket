import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    accentColor: Colors.red,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: Color(0xFFFFFFFF),
      titleTextStyle:
          GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 22.0, color: Color(0xFF404040)),
      iconTheme: IconThemeData(color: Color(0xFF404040)),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
    ),
    primaryTextTheme:
        TextTheme(headline6: GoogleFonts.poppins(color: Color(0xFF212121))),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.poppins(color: Color(0xFF212121)),
      bodyText2: GoogleFonts.poppins(color: Color(0xFF212121)),
    ),
    iconTheme: IconThemeData(color: Color(0xFF404040)),
  );
}

ThemeData darkTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF031a30),
      iconTheme: IconThemeData(color: Color(0xFFbfbfbf)),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: Color(0xFF031e30)),
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          titleTextStyle:
              GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 22.0),
          color: Color(0xFF031a30),
          iconTheme: IconThemeData(color: Color(0xFFB3B3B3))),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Color(0xFF04294F)),
      primaryTextTheme:
          TextTheme(headline6: GoogleFonts.poppins(color: Color(0xFFB3B3B3))),
      cardColor: Color(0xFF1c3046),
      textTheme: TextTheme(
          button: GoogleFonts.poppins(color: Color(0xFFE6E6E6)),
          bodyText2: GoogleFonts.poppins(color: Color(0xFFB3B3B3))));
}
