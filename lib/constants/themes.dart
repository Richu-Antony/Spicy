import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  // Light Theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
        // textTheme: const TextTheme(
        //   //  Title
        //   titleLarge: TextStyle(
        //     fontFamily: 'Bruno',
        //     color: Colors.black,
        //     fontWeight: FontWeight.w900,
        //     fontSize: 25,
        //   ),
        //   titleMedium: TextStyle(
        //     fontFamily: 'Bruno',
        //     color: Colors.black,
        //     fontWeight: FontWeight.w800,
        //     fontSize: 30,
        //   ),
        //   titleSmall: TextStyle(
        //     fontFamily: 'Bruno',
        //     color: Colors.black87,
        //     fontWeight: FontWeight.w800,
        //     fontSize: 20,
        //   ),
        //   // Headings
        //   displayLarge: TextStyle(
        //     fontFamily: 'Pacifico',
        //     color: Colors.black,
        //     fontWeight: FontWeight.w900,
        //     fontSize: 40,
        //   ),
        //   displaySmall: TextStyle(
        //     fontFamily: 'Pacifico',
        //     color: Colors.black,
        //     fontWeight: FontWeight.w500,
        //     fontSize: 30,
        //   ),
        //   // Headline
        //   headlineMedium: TextStyle(
        //     color: AppColors.secondary,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //   ),
        //   headlineSmall: TextStyle(
        //     fontFamily: 'Poppins',
        //     color: Colors.red,
        //     fontWeight: FontWeight.w600,
        //     fontSize: 25,
        //   ),
        //   // Body Content
        //   bodyLarge: TextStyle(
        //     fontFamily: 'Poppins',
        //     color: Colors.black,
        //     fontWeight: FontWeight.w900,
        //     fontSize: 20,
        //   ),
        //   bodyMedium: TextStyle(
        //     fontFamily: 'Poppins',
        //     color: Colors.black54,
        //     fontWeight: FontWeight.w600,
        //     fontSize: 16,
        //   ),
        // ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
      );

  // Dark Theme
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
}
