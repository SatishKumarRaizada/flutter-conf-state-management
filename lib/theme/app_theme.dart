import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  // Light theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.appColor,
    fontFamily: 'MaerskText',
    primarySwatch: AppColors.lightThemeColors,
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.appColor,
      focusColor: AppColors.grey,
      hintStyle: TextStyle(color: AppColors.grey),
      prefixIconColor: AppColors.appColor,
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      errorStyle: const TextStyle(
        fontSize: 16,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 0.2,
          color: Colors.grey.shade200,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.appColor,
        primary: AppColors.white,
        elevation: 0.0,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'MaerskText',
          color: Colors.black,
        ),
      ),
    ),
    primaryIconTheme: IconThemeData(
      color: AppColors.darkBlue,
      size: 25,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.black,
        animationDuration: const Duration(milliseconds: 400),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColors.darkBlue,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.appColor,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontFamily: 'MaerskText',
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 18,
        fontFamily: 'MaerskText',
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.appColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: AppColors.appColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10.0,
      selectedItemColor: AppColors.appColor,
      unselectedItemColor: AppColors.grey,
      type: BottomNavigationBarType.shifting,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: AppColors.appColor,
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.grey,
        size: 25,
      ),
    ),
    cardTheme: CardTheme(
      shadowColor: Colors.white,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );

  // Dark theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[700],
    fontFamily: 'MaerskText',
    primarySwatch: AppColors.darkThemeColors,
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.darkBlue,
      focusColor: AppColors.black,
      hintStyle: TextStyle(color: AppColors.white),
      prefixIconColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      filled: true,
      fillColor: Colors.grey.shade900,
      suffixIconColor: Colors.white,
      errorStyle: const TextStyle(
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.2),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontFamily: 'MaerskText',
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontFamily: 'MaerskText',
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      splashColor: Colors.white,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.all(20.0),
        backgroundColor: Colors.grey.shade900,
        elevation: 0.2,
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide.none,
        ),
        shadowColor: AppColors.appColor,
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.grey,
        primary: AppColors.white,
        elevation: 0.0,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'MaerskText',
          color: Colors.black,
        ),
      ),
    ),
    cardTheme: CardTheme(
      shadowColor: Colors.grey[400],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10.0,
      selectedItemColor: AppColors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.shifting,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: AppColors.white,
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.grey,
        size: 25,
      ),
    ),
  );
}
