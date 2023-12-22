import 'dart:convert';

import 'package:dart_playground/examples/freezed/person.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Can convert JSON (including DateTime) to Person',
    () {
      final person = Person.fromJson(
        {
          'name': 'John',
          'age': 42,
          'lastUpdated': '2024-08-26 12:34:56.123456',
        },
      );
      expect(person.name, 'John');
      expect(person.age, 42);
      expect(person.lastUpdated.toString(), '2024-08-26 12:34:56.123456');
    },
  );

  test('Can convert Person (including DateTime) to JSON', () {
    final person = const Person(name: 'John', age: 42)
        .copyWith(lastUpdated: DateTime.now());
    expect(
      jsonEncode(person),
      '{"name":"John","age":42,"lastUpdated":"2023-12-22"}',
    );
  });
}
