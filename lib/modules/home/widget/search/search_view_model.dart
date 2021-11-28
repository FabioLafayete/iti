import 'package:app/modules/base/base_controller.dart';
import 'package:app/modules/base/base_view_model.dart';
import 'package:app/modules/home/home_view_model.dart';
import 'package:get/get.dart';

class SearchViewModel extends BaseViewModel<BaseController> {

  static final String _text = '_text';

  SearchViewModel(){
    registerObservable(key: _text, variable: '');
  }

  String get text => getVar(_text);

  setText(String value) => setVar(_text, value);

  HomeViewModel homeViewModel = Get.find<HomeViewModel>();

  onChanged(String text) => homeViewModel.filterSearch(text);

  cleanSearch() => homeViewModel.cleanSearch();

}