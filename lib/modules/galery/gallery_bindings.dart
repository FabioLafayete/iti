import 'package:app/modules/galery/gallery_view_model.dart';
import 'package:app/service/api/gallery/gallery_repository.dart';
import 'package:app/service/api/gallery/gallery_service.dart';
import 'package:app/service/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'gallery_controller.dart';

class GalleryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GalleryController(
      galleryRepository: GalleryRepository(
        service: GalleryService(
          httpService: HttpService(dio: Dio())
        )
      )
    ));
    Get.put(GalleryViewModel());
  }

}