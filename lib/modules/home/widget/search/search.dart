import 'package:app/component/page_widget.dart';
import 'package:app/modules/home/widget/search/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SearchBreeds extends BaseWidget<SearchViewModel> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
              color: colors.text,
              width: 0.3
          )
      ),
      margin: EdgeInsets.only(bottom: width * 0.02),
      padding: EdgeInsets.all(width * 0.028),
      width: width,
      height: width * 0.12,
      child: TextField(
        controller: _controller,
        style: TextStyle(color: colors.text.withOpacity(0.9)),
        cursorColor: colors.text,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        decoration: InputDecoration(
          hintText: 'home.search'.tr,
          hintStyle: TextStyle(color: colors.text.withOpacity(0.8)),
          contentPadding: EdgeInsets.only(top: width * 0.1),
          icon: Icon(
            Icons.search,
            color: colors.primary,
            size: width * 0.07,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _controller.clear();
              viewModel.cleanSearch();
              FocusScope.of(context).unfocus();
            },
            padding: EdgeInsets.only(bottom: width * 0.1),
            icon: Icon(
              Icons.clear,
              color: colors.primary,
              size: width * 0.07
            ),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: viewModel.onChanged,
      ),
    );
  }
}
