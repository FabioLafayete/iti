import 'package:get/get.dart';

import '../util/util.dart';

class AppTranslation {
  Map<String, Map<String, dynamic>> map;
}

class TranslationApi {

  static const String ptBr = 'pt_BR';
  static const String enUs = 'en_US';

  getTranslationListMock() async {
    return {
      ptBr: await _loadLang(ptBr),
      enUs: await _loadLang(enUs),
    };
  }

  Future<Map<String, dynamic>> _loadLang(String langType) =>
      Utils.loadJsonToFlatternMap('assets/lang/$langType.json');

  static Future loadTranslations() async {
    final api = TranslationApi();
    Map<String, Map<String, dynamic>> map = await api.getTranslationListMock();
    Get.find<AppTranslation>().map = map;
  }
}