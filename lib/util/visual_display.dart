import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisualDisplay {
  static final VisualDisplay instance = VisualDisplay._();

  VisualDisplay._();

  factory VisualDisplay() => Get.find<VisualDisplay>();

  Future<T> dialog<T>(Widget dialog, {bool barrierDismissible}) => Get.dialog<T>(dialog, barrierDismissible: barrierDismissible ?? false);

  Future<V> bottomSheet<V>(Widget child, {double height, bool dismissible = true}) => Get.bottomSheet<V>(
        Container(
          height: height ?? Get.height * 0.8,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {
                    if (dismissible) Get.back();
                  },
                  child: Container(
                    width: Get.width * 0.15,
                    height: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.width * 0.05),
                    topRight: Radius.circular(Get.width * 0.05),
                  ),
                  color: Colors.white,
                ),
                child: child,
              ),
            ],
          ),
        ),
        ignoreSafeArea: true,
        isScrollControlled: true,
        isDismissible: dismissible,
        enableDrag: dismissible,
      );

  void snackbar(
      String title,
      String message, {
        Color colorText,
        Duration duration,
        bool instantInit = true,
        SnackPosition snackPosition,
        Widget titleText,
        Widget messageText,
        Widget icon,
        bool shouldIconPulse,
        double maxWidth,
        EdgeInsets margin,
        EdgeInsets padding,
        double borderRadius,
        Color borderColor,
        double borderWidth,
        @required Color backgroundColor,
        Color leftBarIndicatorColor,
        List<BoxShadow> boxShadows,
        Gradient backgroundGradient,
        TextButton mainButton,
        OnTap onTap,
        bool isDismissible,
        bool showProgressIndicator,
        SnackDismissDirection dismissDirection,
        AnimationController progressIndicatorController,
        Color progressIndicatorBackgroundColor,
        Animation<Color> progressIndicatorValueColor,
        SnackStyle snackStyle,
        Curve forwardAnimationCurve,
        Curve reverseAnimationCurve,
        Duration animationDuration,
        double barBlur,
        double overlayBlur,
        Color overlayColor,
        Form userInputForm,
      }) =>
      Get.snackbar(
        title,
        message,
        animationDuration: animationDuration,
        backgroundColor: backgroundColor,
        backgroundGradient: backgroundGradient,
        barBlur: barBlur,
        borderColor: borderColor,
        borderRadius: borderRadius ?? 5,
        borderWidth: borderWidth,
        boxShadows: boxShadows,
        colorText: AppColors().textSecondary,
        dismissDirection: dismissDirection,
        duration: duration,
        reverseAnimationCurve: Curves.ease,
        forwardAnimationCurve: Curves.ease,
        instantInit: instantInit,
        isDismissible: isDismissible,
        leftBarIndicatorColor: leftBarIndicatorColor,
        margin: EdgeInsets.symmetric(horizontal: 0),
        maxWidth: maxWidth ?? Get.width,
        messageText: messageText,
        onTap: onTap,
        overlayBlur: overlayBlur,
        overlayColor: overlayColor,
        padding: const EdgeInsets.all(16).copyWith(left: 25),
        progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
        progressIndicatorController: progressIndicatorController,
        progressIndicatorValueColor: progressIndicatorValueColor,
        shouldIconPulse: shouldIconPulse,
        showProgressIndicator: showProgressIndicator,
        snackPosition: snackPosition,
        snackStyle: SnackStyle.GROUNDED,
        titleText: titleText,
        userInputForm: userInputForm,
      );
}
