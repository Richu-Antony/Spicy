import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spicy/constants/colors.dart';
import 'package:spicy/constants/image_strings.dart';
import 'package:spicy/constants/text_string.dart';
import 'package:spicy/services/firebase_auth_service.dart';
import 'package:spicy/widgets/customized_button.dart';
import 'package:spicy/widgets/customized_textfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final RegExp _usernameRegExp = RegExp(
    r'^[a-zA-Z0-9_]+$',
  );
  final RegExp _emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()]).+$',
  );

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Sign Up Screen");
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
      if (_usernameController.text.trim().isEmpty) {
        return false;
      }
      if (_emailController.text.trim().isEmpty) {
        return false;
      }
      if (_passwordController.text.trim().isEmpty) {
        return false;
      }
      if (_confirmPasswordController.text.trim() !=
          _passwordController.text.trim()) {
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
                                textSignUpScreenTitle,
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

                          const SizedBox(height: 10),

                          // Textfield for Username
                          CustomizedTextfield(
                            myController: _usernameController,
                            keyboardType: TextInputType.name,
                            hintText: textSignUpScreenUsername,
                            maxLength: 40,
                            isPassword: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Username is required';
                              } else if (!_usernameRegExp.hasMatch(value)) {
                                return 'Invalid username format';
                              }
                              return null;
                            },
                          ),

                          // Textfield for Email
                          CustomizedTextfield(
                            myController: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: textSignUpScreenEmail,
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
                            hintText: textSignUpScreenPassword,
                            isPassword: true,
                            maxLength: 12,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              } else if (!_passwordRegExp.hasMatch(value)) {
                                return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
                              }
                              return null;
                            },
                          ),

                          // Textfield for Password
                          CustomizedTextfield(
                            myController: _confirmPasswordController,
                            hintText: textSignUpScreenConirmPassword,
                            maxLength: 12,
                            isPassword: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Confirm Password is required';
                              } else if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),

                          // Login Custom Container Button
                          CustomizedButton(
                            buttonText: textSignUpScreenButton,
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
                                    await FirebaseAuthService().signup(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim());
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'email-already-in-use') {
                                      final snackBar = SnackBar(
                                        content: Text(
                                          textSignUpScreenAccountExist,
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else if (kDebugMode) {
                                      print(e.message);
                                    }
                                  } catch (e) {
                                    if (kDebugMode) {
                                      print(e.toString());
                                    }
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
                                  textSignUpScreenBarCenterdText,
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

                          // Other Sign Up Methods
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
                                  textSignUpScreenAlready,
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
                                                const LoginScreen()));
                                  },
                                  child: Text(
                                    textSignUpScreenLogin,
                                    style: const TextStyle(
                                      color: Color(0xff35c2c1),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 40)
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
