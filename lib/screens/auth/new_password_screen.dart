import 'package:flutter/material.dart';
import 'package:spicy/widgets/customized_button.dart';
import 'package:spicy/widgets/customized_textfield.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                    "Create new password",
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
                    "Your new password must be unique from those previously used.",
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

              // Textfield for Password
              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Enter your Password",
                isPassword: true,
              ),

              // Textfield for Password
              CustomizedTextfield(
                myController: _confirmPasswordController,
                hintText: "Enter your Password",
                isPassword: true,
              ),

              // Custom Container Button
              CustomizedButton(
                buttonText: "Reset Password",
                borderColor: Colors.black,
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPressed: () {},
              ),

              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
