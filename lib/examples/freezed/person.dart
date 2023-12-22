import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String name,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}

void main() {
  const person = Person(name: 'John', age: 42);
  final json = person.toJson();
  print(json); // {name: John, age: 42}
  final person2 = Person.fromJson(json);
  print(person2); // Person(name: John, age: 42)
}
