import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/constants/image_strings.dart';
import 'package:spicy/constants/text_string.dart';
import 'package:spicy/screens/home/home_screen.dart';
import 'package:typewritertext/typewritertext.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  bool navigateToHomeScreen = false;

  // After Splash Screen
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      navigateToNextScreen();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void navigateToNextScreen() {
    if (navigateToHomeScreen) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Splash Screen");
    }
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
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
      backgroundColor:
          isDarkMode ? AppColors.darkColorPrimary : AppColors.lightColorPrimary,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            if (kDebugMode) {
              print("Connection State");
            }
            return Container(
              padding: const EdgeInsets.all(30.0),
              height: size.height,
              width: size.width,
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
                            imgSplashScreenlogo,
                            height: size.height * 0.2,
                            // width: 160,
                            fit: BoxFit.cover,
                            isAntiAlias: true,
                          ),
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 1400),
                          child: BlinkText(
                            textAppName,
                            textAlign: TextAlign.center,
                            // beginColor: Colors.black,
                            // endColor: Colors.orange,
                            times: 500,
                            duration: const Duration(seconds: 1),
                            style: TextStyle(
                              fontSize: 26,
                              color: isDarkMode
                                  ? AppColors.darkColorText
                                  : AppColors.lightColorText,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeIn(
                          delay: const Duration(seconds: 2),
                          child: TypeWriterText(
                            text: Text(
                              textTagline,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: isDarkMode
                                    ? AppColors.darkColorTextVarient
                                    : AppColors.lightColorTextVarient,
                              ),
                            ),
                            repeat: true,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ZoomIn(
                    delay: const Duration(seconds: 2),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: size.height * .1,
                    ),
                    // child: CircularProgressIndicator(
                    //   // backgroundColor: AppColors.brandColorDark,
                    //   valueColor: isDarkMode
                    //       ? AlwaysStoppedAnimation<Color>(
                    //           Color.alphaBlend(Colors.white, Colors.white))
                    //       : AlwaysStoppedAnimation<Color>(
                    //           Color.alphaBlend(Colors.black, Colors.black)),
                    //   strokeWidth: 3,
                    // ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            if (kDebugMode) {
              print("Data State");
            }
            navigateToHomeScreen = true;
            return Container(
              padding: const EdgeInsets.all(30.0),
              height: size.height,
              width: size.width,
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
                            imgSplashScreenlogo,
                            height: size.height * 0.2,
                            // width: 160,
                            fit: BoxFit.cover,
                            isAntiAlias: true,
                          ),
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 1400),
                          child: BlinkText(
                            textAppName,
                            textAlign: TextAlign.center,
                            // beginColor: Colors.black,
                            // endColor: Colors.orange,
                            times: 500,
                            duration: const Duration(seconds: 1),
                            style: TextStyle(
                              fontSize: 26,
                              color: isDarkMode
                                  ? AppColors.darkColorText
                                  : AppColors.lightColorText,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeIn(
                          delay: const Duration(seconds: 2),
                          child: TypeWriterText(
                            text: Text(
                              textTagline,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: isDarkMode
                                    ? AppColors.darkColorTextVarient
                                    : AppColors.lightColorTextVarient,
                              ),
                            ),
                            repeat: true,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ZoomIn(
                    delay: const Duration(seconds: 2),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: size.height * .1,
                    ),
                    // child: CircularProgressIndicator(
                    //   // backgroundColor: AppColors.brandColorDark,
                    //   valueColor: isDarkMode
                    //       ? AlwaysStoppedAnimation<Color>(
                    //           Color.alphaBlend(Colors.white, Colors.white))
                    //       : AlwaysStoppedAnimation<Color>(
                    //           Color.alphaBlend(Colors.black, Colors.black)),
                    //   strokeWidth: 3,
                    // ),
                  ),
                ],
              ),
            );
          } else {
            if (kDebugMode) {
              print("Default State");
            }
            // navigateToNextScreen();
            return Container(
              padding: const EdgeInsets.all(30.0),
              height: size.height,
              width: size.width,
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
                            imgSplashScreenlogo,
                            height: size.height * 0.2,
                            // width: 160,
                            fit: BoxFit.cover,
                            isAntiAlias: true,
                          ),
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 1400),
                          child: BlinkText(
                            textAppName,
                            textAlign: TextAlign.center,
                            // beginColor: Colors.black,
                            // endColor: Colors.orange,
                            times: 500,
                            duration: const Duration(seconds: 1),
                            style: TextStyle(
                              fontSize: 26,
                              color: isDarkMode
                                  ? AppColors.darkColorText
                                  : AppColors.lightColorText,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeIn(
                          delay: const Duration(seconds: 2),
                          child: TypeWriterText(
                            text: Text(
                              textTagline,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: isDarkMode
                                    ? AppColors.darkColorTextVarient
                                    : AppColors.lightColorTextVarient,
                              ),
                            ),
                            repeat: true,
                            duration: const Duration(milliseconds: 100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ZoomIn(
                    delay: const Duration(seconds: 2),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: size.height * .1,
                    ),
                    // child: CircularProgressIndicator(
                    //   // backgroundColor: AppColors.brandColorDark,
                    //   valueColor: isDarkMode
                    //       ? AlwaysStoppedAnimation<Color>(
                    //           Color.alphaBlend(Colors.white, Colors.white))
                    //       : AlwaysStoppedAnimation<Color>(
                    //           Color.alphaBlend(Colors.black, Colors.black)),
                    //   strokeWidth: 3,
                    // ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
