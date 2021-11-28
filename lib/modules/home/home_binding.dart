import 'package:app/modules/base/base_controller.dart';
import 'package:app/modules/home/home_controller.dart';
import 'package:app/modules/home/home_view_model.dart';
import 'package:app/modules/home/widget/search/search_view_model.dart';
import 'package:app/service/api/home/home_repository.dart';
import 'package:app/service/api/home/home_service.dart';
import 'package:app/service/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseController());
    Get.put(HomeController(
        homeRepository: HomeRepository(
            service: HomeService(
                httpService: HttpService(dio: Dio())
            )
      )
    ));
    Get.put(HomeViewModel());
    Get.put(SearchViewModel());
  }
}