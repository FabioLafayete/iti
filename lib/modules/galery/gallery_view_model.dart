import 'package:app/modules/base/base_view_model.dart';
import 'package:app/service/api/gallery/models/gallery_response.dart';
import 'package:get/get.dart';
import 'gallery_controller.dart';

class GalleryViewModel extends BaseViewModel<GalleryController> {

  // Declaration
  RxString _breed = ''.obs;
  RxList<String> _listImages = RxList<String>([]);

  // GET
  String get breed => _breed.value;
  List<String> get listImages => _listImages;

  // SET
  setBreed(String value) => _breed.value = value;
  setListImages(List<String> value) => _listImages.value = value;

  // Others
  Future getImages(String breed) async {
    try{
      loading(true);
      GalleryResponseModel model = await controller.getBreeds(breed);
      setListImages(model.images);
    }catch(error){
      print(error);
    } finally {
      loading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
    if (Get.arguments != null) {
      setBreed(Get.arguments['breed']);
      getImages(breed);
    }
  }

}