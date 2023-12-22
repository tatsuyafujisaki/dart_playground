import 'dart:convert';

import 'package:dart_playground/examples/freezed/person.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Can convert String to DateTime',
    () {
      final person = Person.fromJson(
        jsonDecode(
          '{"name":"John","age":42,"lastUpdated":"2024-01-02 12:34:56.123456"}',
        ) as Map<String, dynamic>,
      );
      expect(person.name, 'John');
      expect(person.age, 42);
      expect(person.lastUpdated.toString(), '2024-01-02 12:34:56.123456');
    },
  );

  test(
    'Can convert DateTime to String without subseconds',
    () {
      final person = const Person(name: 'John', age: 42)
          .copyWith(lastUpdated: DateTime(2024, 01, 02, 12, 34, 56, 123, 456));
      expect(
        jsonEncode(person),
        '{"name":"John","age":42,"lastUpdated":"2024-01-02 12:34:56"}',
      );
    },
  );
}
