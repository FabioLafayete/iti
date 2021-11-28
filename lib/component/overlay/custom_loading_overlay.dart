import 'package:app/component/page/page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../modules/base/base_overlay_view_model.dart';

class CustomLoadingOverlay extends BaseWidget<BaseOverlayViewModel> {
  final Widget child;

  CustomLoadingOverlay({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        progressIndicator: Container(
          width: Get.width / 4,
          height: Get.width / 4,
          child: CircularProgressIndicator(
              backgroundColor: colors.primary,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
          ),
        ),
        opacity: 0.6,
        isLoading: viewModel.isLoading,
        color: Colors.black,
        child: this.child,
      ),
    );
  }
}
