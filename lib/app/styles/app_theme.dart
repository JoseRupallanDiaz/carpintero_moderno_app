import 'package:flutter/material.dart';

class AppTheme {
  //Common colors
  static const Color mainBackground = Color(0xffDDD8BC);
  static const Color containerBackground = Color(0xffCABEA4);
  static const Color loginBackground = Color(0xffF2F0D3);
  static const Color inputBackground = Color(0xFFFFFFF4);

  //Buttons
  static const Color buttonPrimary = Color(0xffB26F5B);
  static const Color buttonHighlight = Color(0xFF5A2B18);

  //Text
  static const Color lightTextColor = Color(0xffFFFFF4);
  static const Color darkTextColor = Color(0xff5A2B18);

  // Navbar
  static const Color navbarBackground = Color(0xffF6F7E4);
  static const Color unselectedIcon = Color(0xFFBAB9A5);
  static const Color selectecIcon = Color(0xFFE99B1E);

  static ThemeData theme = ThemeData(
    primarySwatch: Colors.brown,
    scaffoldBackgroundColor: mainBackground,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: navbarBackground,
        selectedItemColor: selectecIcon,
        unselectedItemColor: unselectedIcon,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: darkTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: darkTextColor,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: darkTextColor,
      ),
      labelSmall: TextStyle(
        color: lightTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    ),
    fontFamily: 'Poppins',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: MaterialStateProperty.all<double>(0),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(buttonPrimary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(lightTextColor),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      fillColor: inputBackground,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 0,
        ),
      ),
    ),
  );
}
