import 'package:app/util/assets.dart';
import 'package:app/util/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_observable.dart';
import 'base_overlay_view_model.dart';

abstract class BaseViewModel<T extends GetxController> extends GetxController {
  BaseViewModel({
    this.hasController = true
  });

  Map<String, BaseObservable> observers = {};
  T controller;
  Assets assets;
  bool hasController;
  BaseOverlayViewModel overlay;

  @override
  void onInit() {
    super.onInit();
    assets = Assets();
    overlay = Get.find<BaseOverlayViewModel>();
    if (this.hasController && !T.isNullOrUndefined) controller = Get.find<T>();
  }

  void loading(bool state) => state ? overlay.startLoading() : overlay.stopLoading();


  bool isAllValid(List<String> keys) {
    for (var key in keys) {
      if (!isValid(key)) return false;
    }
    return true;
  }

  bool isAnyValid(List<String> keys) {
    for (var key in keys) {
      if (isValid(key)) return true;
    }
    return false;
  }

  void registerListObservable({
    @required String key,
    @required variable,
  }) {
    observers[key] = ListObservable(
      variable: RxList(variable),
    );
  }

  void registerObservable({
    @required String key,
    @required variable,
    Function validator,
    Function formatter,
    List validatorArgs,
    List formatterArgs,
    bool validateOnUpdate = false,
  }) {
    observers[key] = Observable(
      variable: Rx(variable),
      formatter: formatter,
      validator: validator,
      formatterArgs: formatterArgs,
      validatorArgs: validatorArgs,
      validateOnUpdate: validateOnUpdate,
    );
  }

  dynamic getVar(String key) {
    if (observers[key] == null) return null;
    return observers[key]?.variable;
  }

  void setVar(String key, dynamic value) {
    if (observers[key] == null) return;
    return observers[key].variable = value;
  }

  String getValidation(String key) {
    if (observers[key] == null) return null;
    return observers[key].validateResult;
  }

  void setValidation(String key, dynamic value) {
    if (observers[key] == null) return;
    return observers[key].validateResult = value;
  }

  String getFormatted(String key) {
    if (observers[key] == null) return null;
    return observers[key].format();
  }

  bool isValid(String key) {
    if (observers[key] == null) return false;
    return observers[key].validate();
  }

  void onObservableChange<V>(String key, Function(V) watcher) =>
      ever<V>(observers[key]?.rx, watcher);

}