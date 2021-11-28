import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Assets {
  static const String _assetFolder = 'assets';
  static const String _imagesFolder = '$_assetFolder/images';

  AssetBundle assetBundle;

  Assets._({this.assetBundle});

  static Assets instance({AssetBundle assetBundle}) => Assets._(assetBundle: assetBundle);

  factory Assets() => Get.find<Assets>();

  final String logo = '$_imagesFolder/logo.png';
  final String dog = '$_imagesFolder/dog.png';
  final String background = '$_imagesFolder/background_image.png';

  Future<String> loadString(String assetFile) => assetBundle.loadString(assetFile);
}