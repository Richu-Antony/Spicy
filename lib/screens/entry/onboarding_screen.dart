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
    if (kDebugMode) {
      print("Onboarding Screen");
    }
    final Brightness currentBrightness =
        MediaQuery.of(context).platformBrightness;
    final isDarkMode = currentBrightness == Brightness.dark;
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
                    ? AppColors.darkColorOnboardingScreen1
                    : AppColors.lightColorOnboardingScreen1,
                child: OrientationBuilder(builder: (context, orientation) {
                  return orientation == Orientation.landscape
                      ? SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(imgOnboardingScreen1),
                                height: size.height * 0.5,
                                isAntiAlias: true,
                              ),
                              Column(
                                children: [
                                  Text(
                                    textOnboardingScreenTitle1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: isDarkMode
                                          ? AppColors.darkColorText
                                          : AppColors.lightColorText,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    textOnboardingScreenSubtitle1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(textOnboardingScreenCounter1),
                              const SizedBox(height: 50.0)
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(imgOnboardingScreen1),
                              height: size.height * 0.5,
                            ),
                            Column(
                              children: [
                                Text(
                                  textOnboardingScreenTitle1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.lightColorText,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  textOnboardingScreenSubtitle1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Text(textOnboardingScreenCounter1),
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
                    ? AppColors.darkColorOnboardingScreen2
                    : AppColors.lightColorOnboardingScreen2,
                child: OrientationBuilder(builder: (context, orientation) {
                  return orientation == Orientation.landscape
                      ? SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(imgOnboardingScreen2),
                                height: size.height * 0.5,
                                isAntiAlias: true,
                              ),
                              Column(
                                children: [
                                  Text(
                                    textOnboardingScreenTitle2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: isDarkMode
                                          ? AppColors.darkColorText
                                          : AppColors.lightColorText,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    textOnboardingScreenSubtitle2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(textOnboardingScreenCounter2),
                              const SizedBox(height: 50.0)
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(imgOnboardingScreen2),
                              height: size.height * 0.5,
                            ),
                            Column(
                              children: [
                                Text(
                                  textOnboardingScreenTitle2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.lightColorText,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  textOnboardingScreenSubtitle2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Text(textOnboardingScreenCounter2),
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
                    ? AppColors.darkColorOnboardingScreen3
                    : AppColors.lightColorOnboardingScreen3,
                child: OrientationBuilder(builder: (context, orientation) {
                  return orientation == Orientation.landscape
                      ? SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(imgOnboardingScreen3),
                                height: size.height * 0.5,
                                isAntiAlias: true,
                              ),
                              Column(
                                children: [
                                  Text(
                                    textOnboardingScreenTitle3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: isDarkMode
                                          ? AppColors.darkColorText
                                          : AppColors.lightColorText,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    textOnboardingScreenSubtitle3,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Text(textOnboardingScreenCounter3),
                              const SizedBox(height: 50.0)
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(imgOnboardingScreen3),
                              height: size.height * 0.5,
                            ),
                            Column(
                              children: [
                                Text(
                                  textOnboardingScreenTitle3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.lightColorText,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  textOnboardingScreenSubtitle3,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Text(textOnboardingScreenCounter3),
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
                    textOnboardingScreenSkip,
                    style: TextStyle(
                      fontSize: 18,
                      color: isDarkMode
                          ? AppColors.darkColorText
                          : AppColors.lightColorText,
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
                          textOnboardingScreenDone,
                          style: TextStyle(
                            fontSize: 18,
                            color: isDarkMode
                                ? AppColors.darkColorText
                                : AppColors.lightColorText,
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
                          textOnboardingScreenNext,
                          style: TextStyle(
                            fontSize: 18,
                            color: isDarkMode
                                ? AppColors.darkColorText
                                : AppColors.lightColorText,
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
