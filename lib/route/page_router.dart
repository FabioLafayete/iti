import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageRouter {
  dynamic routeControl;

  PageRouter._({this.routeControl});

  static PageRouter instance({routeControl}) => PageRouter._(routeControl: routeControl);

  factory PageRouter() => Get.find<PageRouter>();

  Future toNamed(String page, {dynamic payload}) => routeControl.toNamed(page, payload: payload);
  Future offNamed(String page, {dynamic payload}) => routeControl.offNamed(page, payload: payload);
  Future offAllNamed(String page, [RoutePredicate predicate]) => routeControl.offAllNamed(page, predicate);
  Future offAndToNamed(String page, {dynamic payload}) => routeControl.offAndToNamed(page, payload: payload);
  void back() => routeControl.back();
  void until(String routeName) => routeControl.until(routeName);
}
