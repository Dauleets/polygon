import 'package:flutter/material.dart';

import 'colors.dart';

class Styles {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme:
          const AppBarTheme(backgroundColor: AppColors.white, elevation: 0),
      textTheme: TextThemes.textTheme(context),
    );
  }
}

class TextThemes {
  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme.copyWith(
          displayLarge: const TextStyle(
            fontFamily: 'SF-Pro-Display',
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          displayMedium: const TextStyle(
            fontFamily: 'SF-Pro-Display',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          displaySmall: const TextStyle(
            fontFamily: 'SF-Pro-Display',
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        );
  }
}
