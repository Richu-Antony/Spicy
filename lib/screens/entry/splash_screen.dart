import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/constants/text_string.dart';
import 'package:spicy/screens/entry/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  // After Splash Screen
  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Splash Screen");
    }
    final Brightness currentBrightness =
        MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = currentBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: isDarkMode ? Colors.transparent : Colors.transparent,
    //   statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    //   systemNavigationBarColor:
    //       isDarkMode ? Colors.transparent : Colors.transparent,
    //   systemNavigationBarDividerColor: Colors.transparent,
    //   systemNavigationBarIconBrightness:
    //       isDarkMode ? Brightness.light : Brightness.dark,
    // ));

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        width: size.width,
        height: double.infinity,
        color: isDarkMode
            ? AppColors.DarkColorPrimary
            : AppColors.LightColorPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BounceInLeft(
                    delay: const Duration(milliseconds: 800),
                    child: Image.asset(
                      'assets/images/splash/hamburger.png',
                      height: size.height * 0.2,
                      // width: 160,
                      fit: BoxFit.cover,
                      isAntiAlias: true,
                    ),
                  ),
                  FadeIn(
                    delay: const Duration(milliseconds: 1400),
                    child: Text(
                      TextAppName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: isDarkMode
                            ? AppColors.DarkColorText
                            : AppColors.LightColorText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeIn(
                    delay: const Duration(seconds: 2),
                    child: Text(
                      TextTagline,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkMode
                            ? AppColors.DarkColorTextVarient
                            : AppColors.LightColorTextVarient,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ZoomIn(
              delay: const Duration(seconds: 2),
              // child: CircularProgressIndicator(
              //   // backgroundColor: AppColors.brandColorDark,
              //   valueColor: isDarkMode
              //       ? AlwaysStoppedAnimation<Color>(
              //           Color.alphaBlend(Colors.white, Colors.white))
              //       : AlwaysStoppedAnimation<Color>(
              //           Color.alphaBlend(Colors.black, Colors.black)),
              //   strokeWidth: 3,
              // ),
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: isDarkMode ? Colors.white : Colors.black,
                size: size.height * .1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
