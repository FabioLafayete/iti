import 'package:app/component/page/page_widget.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseBody extends StatelessWidget {

  final Widget child;
  final Color background;
  final AppBar appBar;
  final bool loading;

  BaseBody({
    this.child,
    this.background,
    this.appBar,
    this.loading = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: this.background ?? AppColors().background,
        appBar: this.appBar,
        body: SafeArea(
          child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.only(
                  left: Get.width * 0.08,
                  right: Get.width * 0.08,
                  top: Get.height * 0.02
              ),
              child: !loading ?
              this.child : Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(AppColors().orange)
                ))
          ),
        ),
      )
    );
  }
}
