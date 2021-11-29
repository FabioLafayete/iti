import 'package:app/component/base_body.dart';
import 'package:app/component/page_widget.dart';
import 'package:app/modules/galery/gallery_view_model.dart';
import 'package:app/modules/galery/widget/show_images.dart';
import 'package:app/modules/home/widget/end_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class GalleryPage extends BaseWidget<GalleryViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseBody(
      appBar: _appBar(),
      background: colors.background,
      loading: viewModel.overlay.isLoading,
      child: Column(
        children: [
          text('gallery.title'.tr,
              textAlign: TextAlign.center,
              color: colors.text.withOpacity(0.9),
              fontSize: width * 0.07
          ),
          space(0.01),
          Expanded(
              child: ListView(
                children: List.generate(viewModel.listImages.length,
                        (index) => ShowImage(
                        image: viewModel.listImages[index]
                    )
                )..add(EndImage()),
              )
          )
        ],
      ),
    ));
  }

  Widget _appBar(){
    return AppBar(
        backgroundColor: colors.primary,
        elevation: 0.0,
        centerTitle: true,
        title: viewModel.breed.length > 0 ? text(
          '${viewModel.breed[0].toUpperCase()}${viewModel.breed.substring(1)}',
          color: colors.textSecondary,
          fontSize: width * 0.06,
        ) : text('')
    );
  }
}
