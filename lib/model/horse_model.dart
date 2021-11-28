import 'package:app/interface/base_model_interface.dart';
import 'package:app/util/extensions.dart';

class HorseModel extends BaseModelInterface {
  int balance;
  List<Offers> offers;

  List<String> images;
  String name, gender, breed, premium;
  int age;

  HorseModel({this.name, this.balance, this.offers});

  HorseModel fromJson(Map<String, dynamic> json) {
    if(json[''])
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers.add(new Offers().fromJson(v));
      });
    }
    name = json['name'];
    balance = json['balance'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['balance'] = this.balance;
    return data;
  }

  @override
  BaseModelInterface fromJsonArray(List list) {
    throw UnimplementedError();
  }

}

class Offers {

  int price;
  String id;
  Product product;

  Offers({this.price, this.id, this.product});

  Offers fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = Product.fromJson(json['product']);
    }
    price = json['price'];
    id = json['id'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['id'] = this.id;
    if (!this.product.isNullOrUndefined) {
      data['product'] = this.product.toJson();
    }
    return data;
  }

}

class Product {
  String name;
  String description;
  String image;

  Product({this.name, this.description, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
