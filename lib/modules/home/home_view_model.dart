import 'package:app/modules/base/base_view_model.dart';
import 'package:app/modules/home/home_controller.dart';
import 'package:app/route/pages_names.dart';
import 'package:app/service/api/home/models/home_response.dart';

class HomeViewModel extends BaseViewModel<HomeController> {

  static final String _listBreeds = '_listBreeds';
  static final String _filterBreed = '_filterBreed';

  HomeViewModel(){
    registerObservable(key: _listBreeds, variable: <List<String>>[]);
    registerObservable(key: _filterBreed, variable: <List<String>>[]);
  }

  List<String> get listBreeds => List.from(getVar(_listBreeds));
  List<String> get filterBreed => List.from(getVar(_filterBreed));

  setListBreeds(List<String> value) => setVar(_listBreeds, value);
  setFilterBreed(List<String> value) => setVar(_filterBreed, value);

  cleanSearch() => setFilterBreed(listBreeds);

  filterSearch(String text) {
    List<String> result = listBreeds.where(
            (value) => value.contains(text)
    ).toList();
    setFilterBreed(result);
  }

  Future getBreeds() async {
    try{
      loading(true);
      HomeResponseModel homeResponseModel = await controller.getBreeds();
      setListBreeds(homeResponseModel.breeds);
      setFilterBreed(homeResponseModel.breeds);
    }catch(error){
      print(error);
    } finally {
      loading(false);
    }
  }

  goToListImages (String breed) => controller.router
      .toNamed(PagesNames.gallery, payload: {'breed': breed});
  
  @override
  void onReady() {
    super.onReady();
    getBreeds();
  }

}