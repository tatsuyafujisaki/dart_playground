import 'dart:convert';
import 'package:dart_playground/examples/freezed/person.dart';

class JsonUtils {
  static List<T> parse<T>(
    String json,
    T Function(Map<String, dynamic> json) converter,
  ) =>
      List<Map<String, dynamic>>.from(jsonDecode(json) as Iterable)
          .map(converter)
          .toList();
}

void main() {
  final people = JsonUtils.parse(
    '[{"name": "John", "age": 18}, {"name": "Jane", "age": 25}]',
    Person.fromJson,
  );
  print(people);
}
