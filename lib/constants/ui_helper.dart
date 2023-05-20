import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class CustomUIOverlayStyle {
  final BuildContext context;
  final bool isDarkMode;

  CustomUIOverlayStyle(this.context, this.isDarkMode);

  void setUIOverlayStyle() {
    final size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDarkMode ? Colors.transparent : Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarColor:
          isDarkMode ? AppColors.darkColorPrimary : AppColors.lightColorPrimary,
      systemNavigationBarDividerColor:
          isDarkMode ? AppColors.darkColorPrimary : AppColors.lightColorPrimary,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
    ));
  }
}
