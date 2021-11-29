import '../../http/http_service.dart';
import 'models/gallery_response.dart';

class GalleryService {
  GalleryService({this.httpService});

  final HttpService httpService;

  Future<GalleryResponseModel> getImages(String breed) => httpService.request(
      path: '/breed/$breed/images',
      type: RequestType.GET,
      dataResponse: GalleryResponseModel(),
  );
}
