import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spicy/constants/colors.dart';

class CustomizedTextfield extends StatefulWidget {
  final TextEditingController myController;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final int? maxLength;
  final Function(String)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  const CustomizedTextfield({
    Key? key,
    required this.myController,
    required this.hintText,
    this.keyboardType,
    this.isPassword,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<CustomizedTextfield> createState() => _CustomizedTextfieldState();
}

class _CustomizedTextfieldState extends State<CustomizedTextfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final Brightness currentBrightness =
        MediaQuery.of(context).platformBrightness;
    final isDarkMode = currentBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword! ? _obscureText : false,
        enableSuggestions: widget.isPassword! ? false : true,
        autocorrect: widget.isPassword! ? false : true,
        controller: widget.myController,
        decoration: InputDecoration(
          counter: const Offstage(),
          hintText: widget.hintText,
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeLowVision,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode
                  ? AppColors.darkColorTrinary
                  : AppColors.lightColorTrinary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode
                  ? AppColors.darkColorTrinary
                  : AppColors.lightColorTrinary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: isDarkMode
              ? AppColors.darkColorTrinary
              : AppColors.lightColorTrinary,
          filled: true,
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
