import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spicy/constants/text_string.dart';
import 'package:spicy/screens/entry/onboarding_screen.dart';
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
    final Brightness currentBrightness =
        MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = currentBrightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDarkMode ? Colors.transparent : Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
      systemNavigationBarDividerColor:
          isDarkMode ? Colors.transparent : Colors.transparent,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
    ));
    return MaterialApp(
      title: textAppName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
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
        "/test": (context) => const TestScreen(),
        "/": (context) => const SplashScreen(),
        "/onboard": (context) => const OnboardScreen(),
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
