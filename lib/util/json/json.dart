import 'dart:convert';

import '../../examples/freezed/person.dart';

// ignore: unreachable_from_main
Map<String, dynamic> jsonDecodeToMap(String json) {
  try {
    return jsonDecode(json) as Map<String, dynamic>;
  } on Exception catch (e, s) {
    print(e);
    print(s);
  }
  return <String, dynamic>{};
}

// ignore: unreachable_from_main
String minifyJson(String json) => jsonEncode(jsonDecode(json));

T _parseObject<T>(
  String json,
  T Function(Map<String, dynamic> json) toElement,
) =>
    toElement(jsonDecode(json) as Map<String, dynamic>);

List<T> _parseArray<T>(
  String json,
  T Function(Map<String, dynamic> json) toElement,
) =>
    List<Map<String, dynamic>>.from(jsonDecode(json) as Iterable)
        .map(toElement)
        .toList();

void main() {
  print(
    _parseObject(
      '{ "name": "John", "age": 42 }',
      Person.fromJson,
    ),
  );
  print(
    _parseArray(
      '[{ "name": "John", "age": 42 }, { "name": "Jane", "age": 18 }]',
      Person.fromJson,
    ),
  );
}
