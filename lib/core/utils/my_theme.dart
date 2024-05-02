import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xffB7935F);
const Color blackColor = Color(0xff242424);
const Color yellowColor = Colors.yellow;

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xFFF5E8DC),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w300, fontSize: 20, color: blackColor),
        bodyMedium: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w500, fontSize: 25, color: primaryColor),
        bodyLarge: GoogleFonts.elMessiri(
            fontWeight: FontWeight.bold, fontSize: 30, color: blackColor),
      ),
      appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          color: Colors.transparent,
          centerTitle: true,
          titleTextStyle: GoogleFonts.elMessiri(
              fontSize: 18, fontWeight: FontWeight.bold, color: blackColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: blackColor,
      ));
  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: blackColor,
      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white),
        bodyMedium: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w500, fontSize: 25, color: primaryColor),
        bodyLarge: GoogleFonts.elMessiri(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          color: Colors.transparent,
          centerTitle: true,
          titleTextStyle: GoogleFonts.elMessiri(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ));
}
