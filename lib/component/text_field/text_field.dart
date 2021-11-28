import 'package:app/util/app_theme.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField  {

  static Widget show({
    IconData icon,
    String hint,
    String errorText,
    bool obscure,
    Function onChanged,
    Function onEditingComplete,
    TextInputType textInputType,
    TextInputAction textInputAction,
    List<TextInputFormatter> inputMask,
    Color colorHint,
    Color colorText,
    Color colorIcon,
    Color colorBorder,
    Color colorCursor,
    bool enabled,
    Widget prefix,
    Widget suffix,
    TextEditingController controller
  }){
    return TextField(
      controller: controller ?? null,
      onChanged: onChanged,
      style: TextStyle(color: colorText, fontSize: 20, fontWeight: FontWeight.w400),
      obscureText: obscure,
      enabled: enabled,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      cursorColor: colorCursor,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputMask,
      decoration: InputDecoration(
          errorText: errorText ?? null,
          prefixIcon: prefix,
          suffixIcon: suffix,
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(right: 20, bottom: 10, top: 20),
          icon: icon != null ? Icon(icon, color: colorIcon) : null,
          labelText: hint,
          labelStyle: TextStyle(color: colorHint, fontSize: 18, fontWeight: FontWeight.w400),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorBorder)
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorBorder)
          ),
      ),
    );
  }


  static Widget profile({
    IconData icon,
    String hint,
    String errorText,
    bool obscure,
    Function onChanged,
    Function onEditingComplete,
    TextInputType textInputType,
    TextInputAction textInputAction,
    List<TextInputFormatter> inputMask,
    Color colorHint,
    Color colorText,
    Color colorIcon,
    Color colorBorder,
    Color colorCursor,
    bool enabled,
    Widget prefix,
    Widget suffix,
    TextEditingController controller
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Get.width * 0.08,
            bottom: Get.height * 0.01
          ),
          child: AppTheme().text(
              hint,
              color: AppColors().textSecondary,
            fontSize: 18
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 10,
            right: Get.width * 0.08,
          ),
          color: AppColors().backgroundHorse,
          child: TextField(
            controller: controller ?? null,
            onChanged: onChanged,
            style: TextStyle(
                color: colorText,
                fontSize: 18,
            ),
            obscureText: obscure,
            enabled: enabled,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            cursorColor: colorCursor,
            onEditingComplete: onEditingComplete,
            inputFormatters: inputMask,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorText: errorText ?? null,
              prefixIcon: prefix,
              suffixIcon: suffix,
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.only(
                right: 20,
                bottom: 10,
                top: 20,
                left:  Get.width * 0.05,
              ),
              icon: icon != null ? Icon(icon, color: colorIcon) : null,
            ),
          ),
        ),
      ],
    );
  }


  static Widget boxText({
    String title,
    String hint,
    Function(String) onChanged,
    Color cursorColor,
  }){
    final text = AppTheme().text;
    final colors = AppColors();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(title, color: colors.textSecondary, fontSize: 18),
        SizedBox(height: Get.height * 0.015),
        TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 3,
            maxLength: 75,
            enabled: true,
            cursorColor: cursorColor,
            onChanged: onChanged,
            textInputAction: TextInputAction.done,
            style: TextStyle(color: cursorColor, fontSize: 20),
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              counterText: '',
              counterStyle: TextStyle(color: colors.text),
              isDense: true,
              contentPadding: EdgeInsets.only(
                  bottom: 30,
                  left: 10,
                  right: 10,
                  top: 10
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: cursorColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: cursorColor),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: cursorColor),
              ),
              fillColor: Color(0xFFFFFFFF),
              hintText: hint,
              hintStyle: TextStyle(color: colors.text, fontSize: 20),
            )
        ),
      ],
    );
  }

  static Widget search(){
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF5A588C).withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
              color: Colors.black,
              width: 0.3
          )
      ),
      margin: EdgeInsets.only(bottom: Get.width * 0.02),
      padding: EdgeInsets.only(
        left: Get.width * 0.05,
        right: Get.width * 0.028,
      ),
      width: Get.width,
      height: Get.width * 0.12,
      child: TextField(
        //controller: _controller,
        style: TextStyle(color: AppColors().text),
        cursorColor: AppColors().text,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        decoration: InputDecoration(
          hintText: 'Pesquisar',
          hintStyle: TextStyle(color: AppColors().text.withOpacity(0.8), fontSize: 18),
          //contentPadding: EdgeInsets.only(top: 0),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
                Icons.search,
                color: AppColors().text,
                size: Get.width * 0.075
            ),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: (_){},
      ),
    );
  }

}