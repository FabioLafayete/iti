import 'package:get/get.dart';

class BearerToken {
  BearerToken._();

  String _token;

  static final BearerToken instance = BearerToken._();

  factory BearerToken() {
    return Get.find<BearerToken>();
  }

  void setBearerToken(String bearer) => _token = bearer;

  String get token => _token;
}
