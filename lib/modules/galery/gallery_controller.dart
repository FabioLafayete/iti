import 'package:app/modules/base/base_controller.dart';
import 'package:app/service/api/gallery/gallery_repository.dart';
import 'package:app/service/api/gallery/models/gallery_response.dart';

class GalleryController extends BaseController {

  final GalleryRepository galleryRepository;

  GalleryController({this.galleryRepository});

  Future<GalleryResponseModel> getBreeds(String breed) =>
      galleryRepository.getImages(breed);

}