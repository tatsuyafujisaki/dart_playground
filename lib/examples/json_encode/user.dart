import 'dart:convert';

class _Person {
  _Person(this.name, this.age);

  _Person.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;
  final String name;
  final int age;

  // toJson() is automatically called then you call jsonEncode(person).
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': 10,
      };
}

void main() {
  final json = '{"name": "Jane", "age": 10}';
  final map = jsonDecode(json) as Map<String, dynamic>;
  final user = _Person.fromJson(map);
  final encoded = jsonEncode(user);
  print(encoded);
}
