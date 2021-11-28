import 'package:app/service/api/home/models/home_response.dart';
import '../../http/http_service.dart';

class HomeService {
  HomeService({this.httpService});

  final HttpService httpService;

  Future<HomeResponseModel> getBreeds() => httpService.request(
      path: '/breeds/list/all',
      type: RequestType.GET,
      dataResponse: HomeResponseModel(),
  );
}
