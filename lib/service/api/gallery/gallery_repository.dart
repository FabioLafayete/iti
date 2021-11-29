import 'gallery_service.dart';
import 'models/gallery_response.dart';

class GalleryRepository {
  final GalleryService service;
  GalleryRepository({this.service});

  Future<GalleryResponseModel> getImages(String breed) => service.getImages(breed);
}
