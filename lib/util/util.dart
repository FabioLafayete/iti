import 'dart:async';
import 'dart:convert';
import 'assets.dart';

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
