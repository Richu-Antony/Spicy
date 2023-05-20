import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spicy/constants/routes.dart';
import 'package:spicy/constants/text_string.dart';
import 'package:spicy/constants/themes.dart';
import 'package:spicy/core/store.dart';
import 'package:spicy/screens/entry/onboarding_screen.dart';
import 'package:spicy/screens/home/cart_screen.dart';
import 'package:spicy/services/firebase_options.dart';
import 'package:spicy/screens/auth/forget_password_screen.dart';
import 'package:spicy/screens/auth/login_screen.dart';
import 'package:spicy/screens/auth/new_password_screen.dart';
import 'package:spicy/screens/auth/otp_verification_screen.dart';
import 'package:spicy/screens/auth/signup_screen.dart';
import 'package:spicy/screens/entry/splash_screen.dart';
import 'package:spicy/screens/entry/welcome_screen.dart';
import 'package:spicy/screens/home/home_screen.dart';
import 'package:spicy/widgets/test_ui_properties_function.dart';
import 'package:velocity_x/velocity_x.dart';

import 'constants/colors.dart';

// App Initilization And Run
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    VxState(
      store: MyStore(),
      child: const MyApp(),
    ),
  );
}

// App Main Stateless Class
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // App Main Build Context
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDarkMode ? Colors.transparent : Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarColor:
          isDarkMode ? AppColors.darkColorPrimary : AppColors.lightColorPrimary,
      systemNavigationBarDividerColor:
          isDarkMode ? AppColors.darkColorPrimary : AppColors.lightColorPrimary,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
    ));

    return MaterialApp(
      title: textAppName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      initialRoute: MyRoutes.initialScreenRoute,
      routes: {
        MyRoutes.initialScreenRoute: (context) => const SplashScreen(),
        MyRoutes.testScreenRoute: (context) => const TestScreen(),
        MyRoutes.onboardingScreenRoute: (context) => const OnboardScreen(),
        MyRoutes.welcomeScreenRoute: (context) => const WelcomeScreen(),
        MyRoutes.loginScreenRoute: (context) => const LoginScreen(),
        MyRoutes.signupScreenRoute: (context) => const SignUpScreen(),
        MyRoutes.forgetpassScreenRoute: (context) =>
            const ForgetPasswordScreen(),
        MyRoutes.otpScreenRoute: (context) => const OtpVerificationScreen(),
        MyRoutes.newpassScreenRoute: (context) => const NewPasswordScreen(),
        MyRoutes.homeScreenRoute: (context) => const HomeScreen(),
        MyRoutes.cartScreenRoute: (context) => const CartScreen(),
      },
    );
  }
}
