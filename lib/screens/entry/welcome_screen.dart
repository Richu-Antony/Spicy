import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/constants/image_strings.dart';
import 'package:spicy/constants/routes.dart';
import 'package:spicy/constants/text_string.dart';
import 'package:spicy/widgets/customized_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Welcome Screen");
    }
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: isDarkMode ? Colors.transparent : Colors.transparent,
    //   statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    //   systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
    //   systemNavigationBarDividerColor:
    //       isDarkMode ? Colors.transparent : Colors.transparent,
    //   systemNavigationBarIconBrightness:
    //       isDarkMode ? Brightness.light : Brightness.dark,
    // ));

    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.darkColorPrimary : AppColors.lightColorPrimary,
      body: Container(
        margin: const EdgeInsets.all(10.0),
        height: size.height,
        width: double.infinity,
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Animation Container File
                      Container(
                        padding: EdgeInsets.zero,
                        height: size.height / 2,
                        width: size.width,
                        child: Lottie.asset(
                          imgWelcomeScreenjsonasset,
                          animate: true,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Welcome Screen Title
                      FadeIn(
                        delay: const Duration(milliseconds: 500),
                        child: Text(
                          textWelcomeScreenTitle,
                          style: TextStyle(
                              color: isDarkMode
                                  ? AppColors.darkColorText
                                  : AppColors.lightColorText,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Welcome Screen Subtitle
                      FadeIn(
                        delay: const Duration(milliseconds: 1000),
                        child: Text(
                          textWelcomeScreenSubtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.2,
                              color: isDarkMode
                                  ? AppColors.darkColorTextVarient
                                  : AppColors.lightColorTextVarient,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Login Custom Container Button
                      FadeIn(
                        delay: const Duration(milliseconds: 1200),
                        child: CustomizedButton(
                          buttonText: textWelcomeScreenLoginButton,
                          borderColor: isDarkMode ? Colors.white : Colors.black,
                          buttonColor: isDarkMode ? Colors.black : Colors.black,
                          textColor: isDarkMode ? Colors.white : Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRoutes.loginScreenRoute);
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                          },
                        ),
                      ),

                      // Sign Up Custom Container Button
                      FadeIn(
                        delay: const Duration(milliseconds: 1200),
                        child: CustomizedButton(
                          buttonText: textWelcomeScreenSignupButton,
                          borderColor: Colors.black,
                          buttonColor: Colors.white,
                          textColor: Colors.black,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRoutes.signupScreenRoute);
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (_) => const SignUpScreen()));
                          },
                        ),
                      ),

                      const SizedBox(height: 20.0),

                      // Guest Account
                      FadeInUp(
                        delay: const Duration(seconds: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            textWelcomeScreenCheckText,
                            style: TextStyle(
                              color: isDarkMode
                                  ? AppColors.darkColorTextVarient
                                  : AppColors.lightColorTextVarient,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Animation Container File
                    Container(
                      padding: EdgeInsets.zero,
                      height: size.height / 2,
                      width: size.width,
                      child: Lottie.asset(
                        imgWelcomeScreenjsonasset,
                        animate: true,
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    // Welcome Screen Title
                    FadeIn(
                      delay: const Duration(milliseconds: 500),
                      child: Text(
                        textWelcomeScreenTitle,
                        style: TextStyle(
                            color: isDarkMode
                                ? AppColors.darkColorText
                                : AppColors.lightColorText,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Welcome Screen Subtitle
                    FadeIn(
                      delay: const Duration(milliseconds: 1000),
                      child: Text(
                        textWelcomeScreenSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.2,
                            color: isDarkMode
                                ? AppColors.darkColorTextVarient
                                : AppColors.lightColorTextVarient,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),

                    Expanded(child: Container()),

                    // Login Custom Container Button
                    FadeIn(
                      delay: const Duration(milliseconds: 1200),
                      child: CustomizedButton(
                        buttonText: textWelcomeScreenLoginButton,
                        borderColor: isDarkMode ? Colors.white : Colors.black,
                        buttonColor: isDarkMode ? Colors.black : Colors.black,
                        textColor: isDarkMode ? Colors.white : Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyRoutes.loginScreenRoute);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                        },
                      ),
                    ),

                    // Sign Up Custom Container Button
                    FadeIn(
                      delay: const Duration(milliseconds: 1200),
                      child: CustomizedButton(
                        buttonText: textWelcomeScreenSignupButton,
                        borderColor: Colors.black,
                        buttonColor: Colors.white,
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyRoutes.signupScreenRoute);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => const SignUpScreen()));
                        },
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    // Guest Account
                    FadeInUp(
                      delay: const Duration(seconds: 1),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          textWelcomeScreenCheckText,
                          style: TextStyle(
                            color: isDarkMode
                                ? AppColors.darkColorTextVarient
                                : AppColors.lightColorTextVarient,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                );
        }),
      ),
    );
  }
}
