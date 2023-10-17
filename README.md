# Best practices
[best-practices.md](markdown/best-practices.md)

# Function
[function.md](markdown/function.md)

# Riverpod
[riverpod.md](markdown/riverpod.md)

# CocoaPods
[cocoa-pods.md](markdown/cocoa-pods.md)

# Division, quotient, and remainder
```dart
print(10 / 3); // 3.33..
print(10 ~/ 3); // 3
print(10 % 3); // 1
```

# Example of the `??=` operator
```dart
void main() {
  String? a = 'a';
  String? b = null;

  a ??= 'c'; // 'c' will not be assigned to a because a is not null.
  b ??= 'c'; // 'c' will be assigned to b because b is null.

  print(a); // a
  print(b); // c
}
```

# Class
## Class with required and optional unnamed (aka positional) parameters (= parameters in square brackets)
```dart
// a ia a required unnamed parameter.
// b is an optional unnamed parameter whose default value is null.
// c is an optional unnamed parameter with a default value.
class MyClass {
  String a;
  String? b;
  String c;

  MyClass(this.a, [this.b, this.c = 'c']);
}

void main() {
  final myClass1 = MyClass('a');
  final myClass2 = MyClass('a', 'b');
  final myClass3 = MyClass('a', 'b', 'c');
}
```

## Class with required and optional named parameters (= parameters in square brackets)
```dart
// a ia a required named parameter.
// b is an optional named parameter whose default value is null.
// c is an optional named parameter with a default value.
class MyClass {
  String a;
  String? b;
  String c;

  MyClass(this.a, {this.b, this.c = 'c'});
}

void main() {
  final myClass1 = MyClass('a');
  final myClass2 = MyClass('a', b: 'b');
  final myClass3 = MyClass('a', b: 'b', c: 'c');
}
```

# How to convert `List<dynamic>` to `List<String>`
Use the [cast\<R>](https://api.flutter.dev/flutter/dart-core/List/cast.html) method.
```dart
final xs = <dynamic>['a', 'b', 'c'];
final ys = xs.cast<String>();
```
