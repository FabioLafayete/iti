import 'package:app/util/util.dart';

import 'enum.dart';
import 'extensions.dart';

class Validators {
  static String notEmpty({String value, String emptyMsg}) {
    if (value == null || value.isEmpty) {
      return emptyMsg;
    }
    return null;
  }

  static String validateEmail({String value, String emptyMsg, String invalidMsg}) {
    if (value.isNullOrEmpty) return emptyMsg;
    if (!Utils.validateKeyByKeyType(KeyType.email, value)) return invalidMsg;
    return null;
  }
}
