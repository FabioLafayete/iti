import 'package:app/service/api/home/models/home_response.dart';
import 'home_service.dart';

class HomeRepository {
  final HomeService service;
  HomeRepository({this.service});

  Future<HomeResponseModel> getBreeds() => service.getBreeds();
}
