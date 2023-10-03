# Function with required and optional positional (i.e. unnamed) parameters (= parameters in square brackets)
```dart
// a ia a required unnamed parameter.
// b is an optional unnamed parameter whose default value is null.
// c is an optional unnamed parameter with a default value.
void f(String a, [String? b, String c = 'c']) {}

void main() {
  f('a');
  f('a', 'b');
  f('a', 'b', 'c');
}
```

# Function with required and optional named parameters (= parameters in curly braces)
```dart
// a ia a required unnamed parameter.
// b ia a required named parameter.
// c is a optional named parameter whose default value is null.
// d is a optional named parameter with a default value.
void f(String a, {required String b, String? c, String d = 'c'}) {}

void main() {
  f('a', b: 'b');
  f('a', b: 'b');
  f('a', b: 'b', c: 'c');
  f('a', b: 'b', c: 'd');
}
```

# `Function` versus `Function()`
```dart
// "Function()" is a parameterless function.
void Function() greet = () => print('Hello!');

// "Function" is any function, regardless of how many parameters it takes.
Function greetFullname =
    (String firstName, String lastName) => print('Hello $firstName $lastName');

void main() {
  greet();
  greetFullname('Christopher', 'Robin');
}
```