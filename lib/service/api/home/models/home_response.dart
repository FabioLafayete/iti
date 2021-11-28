import '../../../../interface/base_model_interface.dart';

class HomeResponseModel extends BaseModelInterface {
  List<String> breeds;

  HomeResponseModel({
    this.breeds
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.breeds != null) {
      data['breeds'] = this.breeds;
    }
    return data;
  }

  @override
  BaseModelInterface fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      breeds = json['message'].keys.toList();
    }
    return this;
  }

  @override
  BaseModelInterface fromJsonArray(List list) {
    throw UnimplementedError();
  }
}
