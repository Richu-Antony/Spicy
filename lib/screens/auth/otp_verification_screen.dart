import 'package:flutter/material.dart';
import 'package:spicy/screens/auth/new_password_screen.dart';
import 'package:spicy/widgets/customized_textfield.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
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
                    "Forget Password?",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Welcome Text
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Enter the verification code we just sent on your email address.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xff8391a1),
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 56,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CustomizedTextfield(
                      myController: _otpController,
                      hintText: "",
                      isPassword: false,
                    ),
                  ),
                  Container(
                    height: 56,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CustomizedTextfield(
                      myController: _otpController,
                      hintText: "",
                      isPassword: false,
                    ),
                  ),
                  Container(
                    height: 56,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CustomizedTextfield(
                      myController: _otpController,
                      hintText: "",
                      isPassword: false,
                    ),
                  ),
                  Container(
                    height: 56,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CustomizedTextfield(
                      myController: _otpController,
                      hintText: "",
                      isPassword: false,
                    ),
                  ),
                ],
              ),

              // Space filler
              const Spacer(flex: 1),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn’t received code?",
                      style: TextStyle(
                        color: Color(0xff6a707c),
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const NewPasswordScreen()));
                      },
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                          color: Color(0xff35c2c1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
