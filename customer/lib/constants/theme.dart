import 'package:customer/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// padding everywhere should either be 12 16 or 20
/// global padding of 24 on every screen.

class CustomTheme {
  static ThemeData appTheme() {
    return ThemeData(
        switchTheme: const SwitchThemeData(
            trackColor: MaterialStatePropertyAll(Colors.white)),
        useMaterial3: true,
        dividerTheme: DividerThemeData(
          thickness: 1,
          space: 0,
          color: Colors.grey.shade300,
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: CustomColors.lightBlack90),
        inputDecorationTheme: InputDecorationTheme(
          prefixStyle: GoogleFonts.nunito(
            color: const Color(0x99565656),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 0.50,
              color: Color(0x33565656),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(width: 0.50, color: CustomColors.grey),
          ),
        ),
        scaffoldBackgroundColor: const Color(0XFFF5F5F5),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 70,
            titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2B2B2B))),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          selectedLabelStyle: GoogleFonts.lato(
              foreground: Paint()
                ..shader = CustomColors.gradient
                    .createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 300.0)),
              height: 1.5,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.lato(
              height: 1.5,
              fontSize: 14,
              color: CustomColors.bottomNavbarLabel,
              fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CustomColors.gradientColor1,
          unselectedItemColor: CustomColors.bottomNavbarLabel,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: const IconThemeData(
            size: 20,
          ),
          unselectedIconTheme: const IconThemeData(
            size: 20,
          ),
        ),
        expansionTileTheme: const ExpansionTileThemeData());
  }
}
