import 'package:app/modules/base/base_controller.dart';
import 'package:app/service/api/home/home_repository.dart';
import 'package:app/service/api/home/models/home_response.dart';

class HomeController extends BaseController {

  final HomeRepository homeRepository;

  HomeController({
    this.homeRepository
  });

  Future<HomeResponseModel> getBreeds() => homeRepository.getBreeds();
}