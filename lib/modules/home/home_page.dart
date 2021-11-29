import 'package:app/component/base_body.dart';
import 'package:app/component/page/page_widget.dart';
import 'package:app/modules/home/widget/end_image.dart';
import 'package:app/modules/home/widget/list_breeds.dart';
import 'package:app/modules/home/widget/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_view_model.dart';

class HomePage extends BaseWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseBody(
      appBar: _appBar(),
      background: colors.white,
      loading: viewModel.overlay.isLoading,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          text(
            'home.title'.tr,
            textAlign: TextAlign.center,
            color: Colors.black.withOpacity(0.9),
            fontSize: width * 0.07,
          ),
          space(0.03),
          SearchBreeds(),
          Obx(() => Expanded(
            child: ListView(
              shrinkWrap: true,
              children: List.generate(
                  viewModel.filterBreed.length,
                      (index) => ListBreeds(
                        breed: viewModel.filterBreed[index],
                        onTap: () => viewModel.goToListImages(viewModel.filterBreed[index]),
                  )
              )..add(EndImage(showText: false)),
            ),
          )),
        ],
      ),
    ));
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: colors.orange,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset(
        assets.logo,
        width: width * 0.38,
        color: colors.white,
      ),
    );
  }
}
