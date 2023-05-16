import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/constants/image_strings.dart';
import 'package:spicy/constants/text_string.dart';
import 'package:spicy/screens/entry/welcome_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final liquidcontroller = LiquidController();
  int currentPage = 0;

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Brightness currentBrightness =
        MediaQuery.of(context).platformBrightness;
    final isDarkMode = currentBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    if (kDebugMode) {
      print("Onboarding Screen");
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Liquid Swiper Pages - 3
          LiquidSwipe(
            liquidController: liquidcontroller,
            enableSideReveal: true,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            onPageChangeCallback: onPageChangeCallback,
            pages: [
              // Page 1
              Container(
                height: size.height,
                width: double.infinity,
                padding: const EdgeInsets.all(30.0),
                color: isDarkMode
                    ? AppColors.DarkColorOnboardingScreen1
                    : AppColors.LigthColorOnboardingScreen1,
                child: OrientationBuilder(builder: (context, orientation) {
                  return orientation == Orientation.landscape
                      ? SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(ImgOnboardingScreen1),
                                height: size.height * 0.5,
                                isAntiAlias: true,
                              ),
                              Column(
                                children: [
                                  Text(
                                    TextOnboardingScreenTitle1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: isDarkMode
                                          ? AppColors.DarkColorText
                                          : AppColors.LightColorText,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    TextOnboardingScreenSubtitle1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(TextOnboardingScreenCounter1),
                              const SizedBox(height: 50.0)
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(ImgOnboardingScreen1),
                              height: size.height * 0.5,
                            ),
                            Column(
                              children: [
                                Text(
                                  TextOnboardingScreenTitle1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: isDarkMode
                                        ? AppColors.DarkColorText
                                        : AppColors.LightColorText,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  TextOnboardingScreenSubtitle1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Text(TextOnboardingScreenCounter1),
                            const SizedBox(height: 50.0)
                          ],
                        );
                }),
              ),

              // Page 2
              Container(
                height: size.height,
                width: double.infinity,
                padding: const EdgeInsets.all(30.0),
                color: isDarkMode
                    ? AppColors.DarkColorOnboardingScreen2
                    : AppColors.LigthColorOnboardingScreen2,
                child: OrientationBuilder(builder: (context, orientation) {
                  return orientation == Orientation.landscape
                      ? SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(ImgOnboardingScreen2),
                                height: size.height * 0.5,
                                isAntiAlias: true,
                              ),
                              Column(
                                children: [
                                  Text(
                                    TextOnboardingScreenTitle2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: isDarkMode
                                          ? AppColors.DarkColorText
                                          : AppColors.LightColorText,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    TextOnboardingScreenSubtitle2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(TextOnboardingScreenCounter2),
                              const SizedBox(height: 50.0)
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(ImgOnboardingScreen2),
                              height: size.height * 0.5,
                            ),
                            Column(
                              children: [
                                Text(
                                  TextOnboardingScreenTitle2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: isDarkMode
                                        ? AppColors.DarkColorText
                                        : AppColors.LightColorText,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  TextOnboardingScreenSubtitle2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Text(TextOnboardingScreenCounter2),
                            const SizedBox(height: 50.0)
                          ],
                        );
                }),
              ),

              // Page 3
              Container(
                height: size.height,
                width: double.infinity,
                padding: const EdgeInsets.all(30.0),
                color: isDarkMode
                    ? AppColors.DarkColorOnboardingScreen3
                    : AppColors.LigthColorOnboardingScreen3,
                child: OrientationBuilder(builder: (context, orientation) {
                  return orientation == Orientation.landscape
                      ? SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(ImgOnboardingScreen3),
                                height: size.height * 0.5,
                                isAntiAlias: true,
                              ),
                              Column(
                                children: [
                                  Text(
                                    TextOnboardingScreenTitle3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: isDarkMode
                                          ? AppColors.DarkColorText
                                          : AppColors.LightColorText,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    TextOnboardingScreenSubtitle3,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(TextOnboardingScreenCounter3),
                              const SizedBox(height: 50.0)
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(ImgOnboardingScreen3),
                              height: size.height * 0.5,
                            ),
                            Column(
                              children: [
                                Text(
                                  TextOnboardingScreenTitle3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: isDarkMode
                                        ? AppColors.DarkColorText
                                        : AppColors.LightColorText,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  TextOnboardingScreenSubtitle3,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Text(TextOnboardingScreenCounter3),
                            const SizedBox(height: 50.0)
                          ],
                        );
                }),
              ),
            ],
          ),

          // Bottom Indication Container
          Container(
            padding: EdgeInsets.zero,
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip Button
                TextButton(
                  onPressed: () {
                    liquidcontroller.jumpToPage(page: 2);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 18,
                      color: isDarkMode
                          ? AppColors.DarkColorText
                          : AppColors.LightColorText,
                    ),
                  ),
                ),

                // Indicator
                AnimatedSmoothIndicator(
                  count: 3,
                  activeIndex: liquidcontroller.currentPage,
                  effect: const ExpandingDotsEffect(),
                ),

                // Next Button and Done Button
                currentPage == 2
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                            fontSize: 18,
                            color: isDarkMode
                                ? AppColors.DarkColorText
                                : AppColors.LightColorText,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          int nextPage = liquidcontroller.currentPage + 1;
                          liquidcontroller.animateToPage(
                            page: nextPage,
                          );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 18,
                            color: isDarkMode
                                ? AppColors.DarkColorText
                                : AppColors.LightColorText,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
