import 'package:app/config/app_config.dart';
import 'package:app/util/app_theme.dart';
import 'package:app/util/assets.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseWidget<T> extends StatelessWidget {

  final Set<T> _value = Set<T>();
  final AppColors colors = AppColors();
  final Assets assets = Assets();
  final AppConfig config = AppConfig();
  final AppTheme appTheme = AppTheme();

  final text = AppTheme().text;

  final double width = Get.width;
  final double height = Get.height;

  Widget space(double value, {bool width = false}){
    return SizedBox(
      height: !width ? Get.height * value : 0,
      width: width ? Get.width * value : 0,
    );
  }

  T get viewModel {
    if (_value.isEmpty) _value.add(Get.find<T>());
    return _value.first;
  }

  @override
  Widget build(BuildContext context);
}
