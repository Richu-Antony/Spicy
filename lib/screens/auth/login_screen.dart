import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/constants/image_strings.dart';
import 'package:spicy/constants/text_string.dart';
import 'package:spicy/screens/auth/forget_password_screen.dart';
import 'package:spicy/screens/auth/signup_screen.dart';
import 'package:spicy/screens/home/home_screen.dart';
import 'package:spicy/services/firebase_auth_service.dart';
import 'package:spicy/widgets/customized_button.dart';
import 'package:spicy/widgets/customized_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp _emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Login Screen");
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

    bool validateData() {
      if (_emailController.text.trim().isEmpty) {
        return false;
      }
      if (_passwordController.text.trim().isEmpty) {
        return false;
      }
      return true; // All data is valid
    }

    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.darkColorPrimary : AppColors.lightColorPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: size.height,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Top Container Back Button
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.lightColorText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.lightColorText,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),

                          // Welcome Text
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                textLoginScreenTitle,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: isDarkMode
                                      ? AppColors.darkColorText
                                      : AppColors.lightColorText,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          // Textfield for Email
                          CustomizedTextfield(
                            myController: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: textLoginScreenEmail,
                            maxLength: 40,
                            isPassword: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              } else if (!_emailRegExp.hasMatch(value)) {
                                return 'Invalid email address';
                              }
                              return null;
                            },
                          ),

                          // Textfield for Password
                          CustomizedTextfield(
                            myController: _passwordController,
                            hintText: textLoginScreenPassword,
                            isPassword: true,
                            maxLength: 12,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                          ),

                          // Forget Password Text
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const ForgetPasswordScreen()));
                                },
                                child: Text(
                                  textLoginScreenForgetText,
                                  style: const TextStyle(
                                    color: Color(0xff6a707c),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          // Login Custom Container Button
                          CustomizedButton(
                            buttonText: textLoginScreenButton,
                            borderColor:
                                isDarkMode ? Colors.white : Colors.black,
                            buttonColor:
                                isDarkMode ? Colors.white : Colors.black,
                            textColor: isDarkMode ? Colors.black : Colors.white,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (validateData()) {
                                  if (kDebugMode) {
                                    print("Data is valid");
                                  }
                                  try {
                                    await FirebaseAuthService().login(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim());
                                    if (FirebaseAuth.instance.currentUser !=
                                        null) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()));
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: const Text(
                                                    " Invalid Email or Password. Please Signup again or make sure that Email and Password is correct."),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SignUpScreen()));
                                                    },
                                                    child:
                                                        const Text("Sign Up"),
                                                  )
                                                ],
                                              ));
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (kDebugMode) {
                                      print(e.message);
                                    }
                                    String errorMessage = '';
                                    switch (e.code) {
                                      case 'user-not-found':
                                        errorMessage = 'User not found';
                                        break;
                                      case 'wrong-password':
                                        errorMessage =
                                            'Invalid email or password';
                                        break;
                                      // Add more cases for other possible exceptions if needed

                                      default:
                                        errorMessage =
                                            'An error occurred. Please try again.';
                                    }
                                    final snackBar = SnackBar(
                                      content: Text(errorMessage),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                } else {
                                  if (kDebugMode) {
                                    print("Data is not valid");
                                  }
                                }
                              }
                            },
                          ),

                          // Bar and Centred Text
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  textLoginScreenBarCenterdText,
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.lightColorText,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Other Login Methods
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Facebook
                                Container(
                                  height: 56,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.darkColorText,
                                    border: Border.all(
                                      color: isDarkMode
                                          ? AppColors.darkColorText
                                          : AppColors.lightColorText,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: IconButton(
                                    icon: Image.asset(
                                      imgLoginSignupFacebook,
                                      fit: BoxFit.contain,
                                      isAntiAlias: true,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),

                                // Google
                                Container(
                                  height: 56,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.darkColorText,
                                    border: Border.all(
                                      color: isDarkMode
                                          ? AppColors.darkColorText
                                          : AppColors.lightColorText,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: IconButton(
                                    icon: Image.asset(
                                      imgLoginSignupGoogle,
                                      fit: BoxFit.contain,
                                      isAntiAlias: true,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),

                                // Apple
                                Container(
                                  height: 56,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? AppColors.darkColorText
                                        : AppColors.darkColorText,
                                    border: Border.all(
                                      color: isDarkMode
                                          ? AppColors.darkColorText
                                          : AppColors.lightColorText,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: IconButton(
                                    icon: Image.asset(
                                      imgLoginSignupApple,
                                      fit: BoxFit.contain,
                                      isAntiAlias: true,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textLoginScreenAlready,
                                  style: const TextStyle(
                                    color: Color(0xff6a707c),
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SignUpScreen()));
                                  },
                                  child: Text(
                                    textLoginScreenSignup,
                                    style: const TextStyle(
                                      color: Color(0xff35c2c1),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
