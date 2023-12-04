class _Person1 {
  _Person1(this.name);
  factory _Person1.fromJson(Map<String, String> json) => _Person1(
        json['name']!,
      );
  final String name;
}

class _Person2 {
  _Person2(Map<String, String> json) : name = json['name']!;
  final String name;
}

void main() {
  final map = <String, String>{'name': 'Jane'};
  final person1 = _Person1.fromJson(map);
  print(person1.name);

  final person2 = _Person2(map);
  print(person2.name);
}
