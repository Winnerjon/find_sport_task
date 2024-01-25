import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      elevation: 3,
      titleSpacing: 0,
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.n01001F,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.n01001F,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    dividerColor: AppColors.n01001F,
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(width: 1, color: AppColors.nE7ECF3),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(width: 1, color: AppColors.nE7ECF3),
        ),
      )
    )
  );
}
