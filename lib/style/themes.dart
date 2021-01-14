import 'package:flutter/material.dart';

ThemeData lightTheme(){
  final ThemeData lightTheme = ThemeData.light();

  return lightTheme.copyWith(
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    accentColor: Colors.red,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: Color(0xFFFFFFFF),
      iconTheme: IconThemeData(
        color: Color(0xFF212121)
      )
    ),

    cardTheme: CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
    ),

    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF212121)
      )
    ),

    textTheme: TextTheme(
       bodyText1: TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF12121)
      ),
      bodyText2: TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF212121)
      ),
    ),

    iconTheme: IconThemeData(
      color: Color(0xFF212121)
    ),
  );
}

ThemeData darkTheme(){
  final ThemeData darkTheme = ThemeData.dark();

  return darkTheme.copyWith(
    scaffoldBackgroundColor: Color(0xFF031a30),


    iconTheme: IconThemeData(
      color: Color(0xFFcccccc)
    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: Color(0xFF031a30),
      iconTheme: IconThemeData(
        color: Color(0xFFcccccc)
      )
    ),

      cardTheme: CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent
    ),

    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFFcccccc)
      )
    ),

    cardColor: Color(0xFF031a30),
      textTheme: TextTheme(
       button: TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFFE6E6E6)
      ),
      bodyText2: TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFFcccccc)
      )
    )
  );
}
