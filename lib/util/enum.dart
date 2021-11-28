enum KeyType {
  email,
  mobile,
  document,
  none,
  evp
}

class KeyTypes {
  static KeyType fromKey(String keyValue) => _fromStringToKeyType[keyValue];

  static String toKey(KeyType keyType) => _toStringFromKeyType[keyType];
}

Map<String, KeyType> _fromStringToKeyType = {
  'document': KeyType.document,
  'mobile': KeyType.mobile,
  'email': KeyType.email,
  'evp': KeyType.evp,
};

Map<KeyType, String> _toStringFromKeyType = {
  KeyType.document: 'document',
  KeyType.mobile: 'mobile',
  KeyType.email: 'email',
  KeyType.evp: 'evp',
};