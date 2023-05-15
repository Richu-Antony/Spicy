import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spicy/services/firebase_options.dart';
import 'package:spicy/screens/auth/forget_password_screen.dart';
import 'package:spicy/screens/auth/login_screen.dart';
import 'package:spicy/screens/auth/new_password_screen.dart';
import 'package:spicy/screens/auth/otp_verification_screen.dart';
import 'package:spicy/screens/auth/signup_screen.dart';
import 'package:spicy/screens/entry/splash_screen.dart';
import 'package:spicy/screens/entry/welcome_screen.dart';
import 'package:spicy/screens/home/home_screen.dart';
import 'package:spicy/screens/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spicy',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/test": (context) => const TestScreen(),
        "/welcome": (context) => const WelcomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignUpScreen(),
        "/forgetpass": (context) => const ForgetPasswordScreen(),
        "/otp": (context) => const OtpVerificationScreen(),
        "/newpass": (context) => const NewPasswordScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
