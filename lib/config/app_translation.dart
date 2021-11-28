import 'package:get/get.dart';

import '../util/util.dart';

class AppTranslation {
  static const String ptBr = 'pt_BR';

  AppTranslation._();

  static final AppTranslation instance = AppTranslation._();

  factory AppTranslation() => Get.find<AppTranslation>();

  Future<Map<String, Map<String, dynamic>>> load() async {
    Map<String, Map<String, dynamic>> translations = {};
    translations[ptBr] = await _loadLang(ptBr);
    return translations;
  }

  Future<Map<String, dynamic>> _loadLang(String langType) =>
      Utils.loadJsonToFlatternMap('assets/lang/$langType.json');
}
