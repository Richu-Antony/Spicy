import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Form(
              key: _formKey,
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
                        "Hello! Register to get \nStarted",
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

                  // Textfield for Username
                  CustomizedTextfield(
                    myController: _usernameController,
                    keyboardType: TextInputType.name,
                    hintText: "Enter your Username",
                    maxLength: 40,
                    isPassword: false,
                    // maxLengthindication: true,
                  ),

                  // Textfield for Email
                  CustomizedTextfield(
                    myController: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Enter your Email",
                    maxLength: 40,
                    isPassword: false,
                    // maxLengthindication: true,
                  ),

                  // Textfield for Password
                  CustomizedTextfield(
                    myController: _passwordController,
                    // keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter your Password",
                    maxLength: 12,
                    isPassword: true,
                    // maxLengthindication: true,
                  ),

                  // Textfield for Password
                  CustomizedTextfield(
                    myController: _confirmPasswordController,
                    // keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter your Password",
                    maxLength: 12,
                    isPassword: true,
                    // maxLengthindication: true,
                  ),

                  // Login Custom Container Button
                  CustomizedButton(
                    buttonText: "Login",
                    borderColor: Colors.black,
                    buttonColor: Colors.black,
                    textColor: Colors.white,
                    onPressed: () async {
                      try {
                        await FirebaseAuthService().signup(
                            _emailController.text.trim(),
                            _passwordController.text.trim());
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      } on FirebaseException catch (e) {
                        if (kDebugMode) {
                          print(e.message);
                        }
                      }
                    },
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
                        const Text(" Or Register with "),
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
                          "Already have an account?",
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
                                    builder: (_) => const LoginScreen()));
                          },
                          child: const Text(
                            "Login Now",
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
      ),
    );
  }
}
