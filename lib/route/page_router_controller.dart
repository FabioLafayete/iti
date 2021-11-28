import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageRouterController {
  PageRouterController();
  Future toNamed(String page, {dynamic payload}) => Get.toNamed(page, arguments: payload);
  Future offNamed(String page, {dynamic payload}) => Get.offNamed(page, arguments: payload);
  Future offAllNamed(String page, [RoutePredicate predicate]) => Get.offAllNamed(page, predicate: predicate);
  Future offAndToNamed(String page, {dynamic payload}) => Get.offAndToNamed(page, arguments: payload);
  void back() => Get.back();
  void until(String routeName) => Get.until((route) => Get.currentRoute == routeName);
}
