import 'package:app/util/app_theme.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton {

  static Widget show ({
    VoidCallback onPress,
    String text,
    bool loading = false,
    double elevation,
    double borderRadius,
    double heightButton,
    double widthButton,
    Color color,
    Color textColor,
    Color disabledColor,
    Color disabledTextColor,
    Color borderSideColor,
    Color splashColor,
    double fontSize,
    double widthBorder
  }){
    return SizedBox(
        height: heightButton,
        width: widthButton,
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: color,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderSideColor, width: widthBorder),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: elevation,
            splashColor: splashColor ?? Colors.red,
            child: loading ? Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  )
              ),
            ) :
            Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize
                )
            ),
            textColor: textColor,
            disabledColor: disabledColor,
            disabledTextColor: disabledTextColor,
            onPressed: onPress
        )
    );
  }

}