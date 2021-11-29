import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {

  ColorsSchema _light = ColorsSchema(
      text: Colors.black,
      textSecondary: Colors.white,
      primary: Color.fromRGBO(205, 74, 20, 1),
      background: Color(0xFFF5F8FA)
  );

  ColorsSchema _dark = ColorsSchema(
      text: Colors.white,
      textSecondary: Colors.white,
      primary: Color.fromRGBO(205, 74, 20, 1),
      background: Color(0xFF303030)
  );

  ColorsSchema get light => _light;
  ColorsSchema get dark => _dark;

  Color get text => Get.context.theme.textTheme.bodyText1.color;
  Color get textSecondary => Get.context.theme.textTheme.bodyText2.color;
  Color get primary => Get.context.theme.primaryColor;
  Color get background => Get.context.theme.backgroundColor;

}

class ColorsSchema {

  final Color background;
  final Color primary;
  final Color text;
  final Color textSecondary;

  ColorsSchema({
    this.textSecondary,
    this.text,
    this.primary,
    this.background
  });

}