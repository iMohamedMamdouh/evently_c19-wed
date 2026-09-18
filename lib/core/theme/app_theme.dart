import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBgColor,
    primaryColor: AppColors.lightPrimaryColor,
    primaryColorLight: AppColors.lightPrimaryColor,
    cardColor: Colors.white,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextColor,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBgColor,
    primaryColor: AppColors.darkPrimaryColor,
    primaryColorLight: AppColors.darkTextColor,
    cardColor: AppColors.darkCardColor,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextColor,
      ),
    ),
  );
}
