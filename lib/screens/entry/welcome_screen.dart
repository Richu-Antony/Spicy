import 'package:flutter/material.dart';
import 'package:spicy/screens/auth/login_screen.dart';
import 'package:spicy/screens/auth/signup_screen.dart';
import 'package:spicy/widgets/customized_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                isAntiAlias: true,
                opacity: 0.5,
                image: AssetImage('assets/images/background/welcome_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Bottom Positioned Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 40.0),

                    // Login Custom Container Button
                    CustomizedButton(
                      buttonText: 'Login',
                      borderColor: Colors.black,
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      },
                    ),

                    // Sign Up Custom Container Button
                    CustomizedButton(
                      buttonText: 'Sign Up',
                      borderColor: Colors.black,
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignUpScreen()));
                      },
                    ),
                    const SizedBox(height: 20.0),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Continue as a Guest",
                        style: TextStyle(
                          color: Color(0xff35c22c1),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15)
                  ],
                ),
              ),
            ),
          ),

          // Centered Icon and Text
          Container(
            padding: EdgeInsets.zero,
            alignment: const Alignment(0, 0),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage('assets/images/logo/hamburger.png'),
                  height: 130,
                  isAntiAlias: true,
                ),
                Text(
                  'Spicy',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
