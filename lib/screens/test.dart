import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  // Variables
  final int day = 5;
  final String name = "Richu Antony";

  const TestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${day}st Day Of Development by $name",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
