import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'sst-arabic',
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: AppColor.bodyTextColor,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ).bodyMedium,
        titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ).titleLarge,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.primaryColor,
        selectionHandleColor: AppColor.primaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryColor,
        ),
        prefixIconColor: Colors.grey[700],
        suffixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryColor,
        ),
        suffixIconColor: AppColor.primaryColor,
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.black45,
        ),
        labelStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'sst-arabic',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.white;
          },
        ),
      ),
      cardColor: Colors.grey[900],
      cardTheme: const CardTheme(
        color: Colors.grey,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black26,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
        titleTextStyle: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ).titleMedium,
        toolbarTextStyle: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ).bodySmall,
      ),
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.primaryColor,
        selectionHandleColor: AppColor.primaryColor,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColor.primaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        suffixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryColor,
        ),
        prefixIconColor: Colors.amber.shade200,
        suffixIconColor: Colors.amber.shade200,
        fillColor: Colors.grey[900],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Colors.white70,
        ),
        labelStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.darkColor,
        //change theme for text inside button
        extendedTextStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      textTheme: darkTextTheme,
    );
  }

  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    ),
    bodyMedium: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade700,
    ),
    bodySmall: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade700,
    ),
    titleLarge: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayLarge: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    ),
    displayMedium: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    ),
    displaySmall: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      color: Colors.black45,
      fontWeight: FontWeight.w600,
    ),
  );
}
