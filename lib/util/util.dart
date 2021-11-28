import 'dart:async';
import 'dart:convert';
import 'assets.dart';
import 'enum.dart';

enum IOType {
  file,
  directory,
}

class Utils {
  static Map<String, dynamic> refType = {};

  static Map _debouncer = {};

  static String maskBalance(int balance) {
    bool isNegative = balance < 0;
    if (isNegative) balance = balance * -1;
    String maskedBalance = (balance / 100).toStringAsFixed(2).split('.').map((e) => e.split(RegExp(r'(?=(?:...)*$)')).join('.')).join(',');
    return '${isNegative ? '-' : ''}$maskedBalance';
  }

  static Future<Map<String, dynamic>> loadJsonToFlatternMap(String assetFile) async {
    Map<String, dynamic> loadedJson = await loadJsonToMap(assetFile);
    return flatternMap(loadedJson);
  }

  static bool validateKeyByKeyType(KeyType type, String value) {
    RegExp validation = _keyRegexp[type];
    return validation.hasMatch(value);
  }

  static Future<Map<String, dynamic>> loadJsonToMap(String assetFile) async {
    return await Assets().loadString(assetFile).then((jsonStr) => jsonDecode(jsonStr));
  }

  static V debouncerFunctionByKey<V>(String key, Function action, int miliseconds) {
    if (!_debouncer.containsKey(key)) {
      _debouncer[key] = true;
      Timer(Duration(milliseconds: miliseconds), () {
        _debouncer.remove(key);
      });
      return action();
    }
    return null;
  }


  static Map<String, dynamic> flatternMap(Map<String, dynamic> dataMap) {
    Map<String, dynamic> finalData = {};
    dataMap.forEach((key, value) {
      if (value is Map) {
        Map<String, dynamic> innerData = flatternMap(value);
        innerData.forEach((innerKey, innerValue) {
          finalData['$key.$innerKey'] = innerValue;
        });
      } else {
        finalData[key] = value;
      }
    });
    return finalData;
  }

}

final Map<KeyType, RegExp> _keyReplacements = {
  KeyType.document: new RegExp(r'\D'),
  KeyType.mobile: new RegExp(r'(\+|\-|\s|\(|\))'),
  KeyType.email: RegExp(r''),
  KeyType.evp: RegExp(r''),
};

final Map<KeyType, RegExp> _keyRegexp = {
  KeyType.document: RegExp(r'(^\d{11}$)|(^\d{14}$)'),
  KeyType.mobile: RegExp(r'(\d){11,13}$'),
  KeyType.email: RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
  KeyType.evp: RegExp(r'^\d{8}-\d{4}-\d{4}-\d{4}-\d{12}$'),
};
