import '../../../../interface/base_model_interface.dart';

class GalleryResponseModel extends BaseModelInterface {

  List<String> images;

  GalleryResponseModel({
    this.images
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.images != null) {
      data['message'] = this.images;
    }
    return data;
  }

  @override
  BaseModelInterface fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      images = List<String>.from(json['message']);
    }
    return this;
  }

  @override
  BaseModelInterface fromJsonArray(List list) {
    throw UnimplementedError();
  }
}
