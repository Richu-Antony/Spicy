import 'package:flutter/material.dart';
import 'package:spicy/screens/auth/forget_password_screen.dart';
import 'package:spicy/screens/auth/signup_screen.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
      //     child: Container(
      //       height: 50,
      //       width: 50,
      //       decoration: BoxDecoration(
      //         border: Border.all(
      //           color: Colors.black,
      //           width: 1,
      //         ),
      //         borderRadius: BorderRadius.circular(10.0),
      //       ),
      //       child: IconButton(
      //         icon: const Icon(Icons.arrow_back_ios_sharp),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ),
      //   ),
      //
      //   // Appbar Properties
      //   titleSpacing: 1.9,
      //   toolbarHeight: 65,
      //   toolbarOpacity: 0.8,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomRight: Radius.circular(25),
      //         bottomLeft: Radius.circular(25)),
      //   ),
      //   elevation: 5,
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
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
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),

                // Welcome Text
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Welcome back! Glad \nto see you again",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Textfield for Email
                CustomizedTextfield(
                  myController: _emailController,
                  hintText: "Enter your Email",
                  isPassword: false,
                ),

                // Textfield for Password
                CustomizedTextfield(
                  myController: _passwordController,
                  hintText: "Enter your Password",
                  isPassword: true,
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
                                builder: (_) => const ForgetPasswordScreen()));
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Color(0xff6a707c),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),

                // Login Custom Container Button
                CustomizedButton(
                  buttonText: "Login",
                  borderColor: Colors.black,
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {},
                ),

                // Bar
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Text(" Or Login with "),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 56,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/icons/facebook.png',
                            fit: BoxFit.contain,
                            isAntiAlias: true,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/icons/google.png',
                            fit: BoxFit.contain,
                            isAntiAlias: true,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/icons/apple.png',
                            fit: BoxFit.contain,
                            isAntiAlias: true,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                // Space filler
                const Spacer(flex: 1),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
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
                                  builder: (_) => const SignUpScreen()));
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
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
    );
  }
}
