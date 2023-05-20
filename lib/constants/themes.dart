import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class MyThemes {
  //

  // Light Theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: AppColors.lightColorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        applyElevationOverlayColor: true,
        splashFactory: InkSplash.splashFactory,
        cardColor: AppColors.lightColorSecondary,
        iconTheme: const IconThemeData(color: AppColors.lightColorText),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.lightColorText,
          ),
          displayMedium: TextStyle(
            color: AppColors.lightColorText,
          ),
          displaySmall: TextStyle(
            color: AppColors.lightColorText,
          ),
          headlineMedium: TextStyle(
            color: AppColors.lightColorText,
          ),
          headlineSmall: TextStyle(
            color: AppColors.lightColorText,
          ),
          titleLarge: TextStyle(
            color: AppColors.lightColorText,
          ),
          titleMedium: TextStyle(
            color: AppColors.lightColorText,
          ),
          titleSmall: TextStyle(
            color: AppColors.lightColorText,
          ),
          bodyLarge: TextStyle(
            color: AppColors.lightColorText,
          ),
          bodyMedium: TextStyle(
            color: AppColors.lightColorText,
          ),
          bodySmall: TextStyle(
            color: AppColors.lightColorText,
          ),
          labelLarge: TextStyle(
            color: AppColors.lightColorText,
          ),
          labelSmall: TextStyle(
            color: AppColors.lightColorText,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.lightColorText,
        ),
        appBarTheme: const AppBarTheme(
          color: AppColors.lightColorPrimary,
          iconTheme: IconThemeData(
            color: AppColors.lightColorText,
          ),
          elevation: 7.0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 5.0,
          backgroundColor: AppColors.lightColorPrimary,
          selectedItemColor: AppColors.lightColorText,
          unselectedItemColor: AppColors.lightColorTextHideVarient,
        ),
      );

  // Dark Theme
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: AppColors.darkColorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        applyElevationOverlayColor: true,
        splashFactory: InkSplash.splashFactory,
        cardColor: AppColors.darkColorTrinary,
        iconTheme: const IconThemeData(color: AppColors.darkColorText),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.darkColorText,
          ),
          displayMedium: TextStyle(
            color: AppColors.darkColorText,
          ),
          displaySmall: TextStyle(
            color: AppColors.darkColorText,
          ),
          headlineMedium: TextStyle(
            color: AppColors.darkColorText,
          ),
          headlineSmall: TextStyle(
            color: AppColors.darkColorText,
          ),
          titleLarge: TextStyle(
            color: AppColors.darkColorText,
          ),
          titleMedium: TextStyle(
            color: AppColors.darkColorText,
          ),
          titleSmall: TextStyle(
            color: AppColors.darkColorText,
          ),
          bodyLarge: TextStyle(
            color: AppColors.darkColorText,
          ),
          bodyMedium: TextStyle(
            color: AppColors.darkColorText,
          ),
          bodySmall: TextStyle(
            color: AppColors.darkColorText,
          ),
          labelLarge: TextStyle(
            color: AppColors.darkColorText,
          ),
          labelSmall: TextStyle(
            color: AppColors.darkColorText,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: AppColors.darkColorPrimary,
          iconTheme: IconThemeData(
            color: AppColors.darkColorText,
          ),
          elevation: 7.0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 7.0,
          backgroundColor: AppColors.darkColorPrimary,
          selectedItemColor: AppColors.darkColorText,
          unselectedItemColor: AppColors.darkColorTextHideVarient,
        ),
      );
}
