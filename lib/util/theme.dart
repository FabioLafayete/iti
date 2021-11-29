import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class Themes {

  final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors().light.primary,
    backgroundColor: AppColors().light.background,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: AppColors().light.text),
      bodyText2: TextStyle(color: AppColors().light.textSecondary),
    )
  );

  final darkTheme = ThemeData.light().copyWith(
      primaryColor: AppColors().dark.primary,
      backgroundColor: AppColors().dark.background,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: AppColors().dark.text),
        bodyText2: TextStyle(color: AppColors().dark.textSecondary),
      )
  );

}