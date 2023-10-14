class Person {
  Person({required this.firstName, required this.lastName})
      : fullName = '$firstName $lastName';

  String firstName;
  String lastName;
  String fullName;
}

void main() {
  final person = Person(firstName: 'Christopher', lastName: 'Robin');
  print(person.firstName);
  print(person.lastName);
  print(person.fullName);
}
