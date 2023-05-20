import 'package:flutter/material.dart';
import 'package:spicy/constants/colors.dart';

// Header
class FoodlistHeader extends StatelessWidget {
  const FoodlistHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spicy',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? AppColors.darkColorText : AppColors.lightColorText,
          ),
        ),
        Text(
          'Trending products',
          style: TextStyle(
            fontSize: 24.0,
            color: isDarkMode
                ? AppColors.darkColorTrinaryButtonVarient
                : AppColors.lightColorTextVarient,
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
