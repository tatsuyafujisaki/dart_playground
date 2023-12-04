class _Person {
  _Person(this.name, this.age);

  factory _Person.fromJson(Map<String, dynamic> json) => _Person(
        json['name'] as String,
        json['age'] as int,
      );
  final String name;
  final int age;
}

void main() {
  final person = _Person.fromJson(<String, dynamic>{'name': 'Jane', 'age': 18});
  print(person.name);
  print(person.age);
}
