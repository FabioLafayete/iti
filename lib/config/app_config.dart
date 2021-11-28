import 'package:get/get.dart';
import 'config.dart' show environment;
class AppConfig {

  factory AppConfig() => Get.find<AppConfig>();

  AppConfig._();

  static final AppConfig instance = AppConfig._();
  String _baseUrl;
  String _bearerToken;

  Map<String, dynamic> _config = environment;

  Future load() async {
    _baseUrl = _config['baseUrl'];
    _bearerToken = _config['bearerToken'];
  }

  get baseUrl => _baseUrl;
  get bearerToken => _bearerToken;
}