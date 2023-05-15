import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spicy/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Variables
  bool isAntiAlias = true;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const OnboardScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Splash Screen");
    return Scaffold(
      body: Container(
        padding: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Background
            // SizedBox(
            //   height: double.infinity,
            //   width: double.infinity,
            //   child: Image.asset(
            //     'assets/images/logo/hamburger.png',
            //     fit: BoxFit.cover,
            //     isAntiAlias: true,
            //   ),
            // ),

            // Content
            ZoomIn(
              delay: const Duration(seconds: 1),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo/hamburger.png',
                        height: 130,
                        fit: BoxFit.cover,
                        isAntiAlias: true,
                      ),
                    ),
                    const Text(
                      "Spicy",
                    ),
                  ],
                ),
              ),
            ),

            ZoomIn(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: CircularProgressIndicator(
                    // backgroundColor: AppColors.brandColorDark,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.alphaBlend(Colors.red[50]!, Colors.red[50]!)),
                    strokeWidth: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
