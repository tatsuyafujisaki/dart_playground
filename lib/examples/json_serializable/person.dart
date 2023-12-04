import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

enum Gender { female, male }

@JsonSerializable()
class Person {
  Person({required this.firstName, required this.lastName, this.gender});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  final String firstName;
  final String lastName;
  final Gender? gender;

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

void _print(Person person) {
  print(person.firstName);
  print(person.lastName);
  print(person.gender);
  print(person.toJson());
}

void main() {
  final map = <String, dynamic>{
    'firstName': 'Nobita',
    'lastName': 'Nobi',
    'gender': 'male',
  };
  _print(Person.fromJson(map));
}
