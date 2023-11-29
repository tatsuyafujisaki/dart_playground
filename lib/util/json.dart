import 'dart:convert';

import 'package:dart_playground/examples/freezed/person.dart';

class _Json {
  static T parseObject<T>(
    String json,
    T Function(Map<String, dynamic> json) toElement,
  ) =>
      toElement(jsonDecode(json) as Map<String, dynamic>);

  static List<T> parseList<T>(
    String json,
    T Function(Map<String, dynamic> json) toElement,
  ) =>
      List<Map<String, dynamic>>.from(jsonDecode(json) as Iterable)
          .map(toElement)
          .toList();
}

void main() {
  print(
    _Json.parseObject(
      '{ "name": "Jane", "age": 18 }',
      Person.fromJson,
    ),
  );
  print(
    _Json.parseList(
      '[{ "name": "Jane", "age": 18 }, { "name": "John", "age": 20 }]',
      Person.fromJson,
    ),
  );
}
