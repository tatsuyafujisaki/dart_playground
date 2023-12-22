import 'dart:convert';

import 'package:dart_playground/util/json/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String name,
    required int age,
    @DateTimeConverter() DateTime? lastUpdated,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}

void main() {
  final person =
      const Person(name: 'John', age: 42).copyWith(lastUpdated: DateTime.now());
  final map = person.toJson();
  print(map);
  print(Person.fromJson(map));
  print(jsonEncode(person)); // jsonEncode implicitly calls toJson.
}
