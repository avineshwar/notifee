import 'dart:collection';
import 'dart:math';

void isNotNullOrEmpty(String key, String value) {
  String msg = 'Expedted property "$key" to be a non-null and non-empty value.';
  assert(value != null, msg);
  assert(value.isNotEmpty, msg);
}

abstract class NotifeeBridge {
  Map build();
}

class IdGenerator {
  static const int _AUTO_ID_LENGTH = 20;

  static const String _AUTO_ID_ALPHABET =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  static final Random _random = Random();

  static String randomId() {
    final StringBuffer stringBuffer = StringBuffer();
    final int maxRandom = _AUTO_ID_ALPHABET.length;

    for (int i = 0; i < _AUTO_ID_LENGTH; ++i) {
      stringBuffer.write(_AUTO_ID_ALPHABET[_random.nextInt(maxRandom)]);
    }

    return stringBuffer.toString();
  }
}

abstract class Enum<T> {
  final T _value;

  const Enum(this._value);

  T get value => _value;
}

Map convertLinkedHashMap<K, V>(LinkedHashMap linkedHashMap) {
  if (linkedHashMap == null) {
    return null;
  }

  if (linkedHashMap.isEmpty) {
    return new Map<K, V>();
  }

  return Map.from(linkedHashMap.map((key, value) {
    if (value is LinkedHashMap) {
      return MapEntry(key.toString(), convertLinkedHashMap<String, dynamic>(value));
    }

    return MapEntry(
      key as K,
      value as V,
    );
  }));
}
