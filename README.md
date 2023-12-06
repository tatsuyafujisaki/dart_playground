# Best practices
[best-practices.md](markdown/best-practices.md)

# Lint
[lint.md](markdown/lint.md)

# Function
[function.md](markdown/function.md)

# Asynchronous
[asynchronous.md](markdown/asynchronous.md)

# Freezed
[freezed.md](markdown/freezed.md)

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

# Required parameter / optional parameter / named parameter / unnamed (aka positional) parameter
## Example of unnamed (aka positional) parameters
```dart
// a ia a required unnamed parameter.
// b is an optional unnamed (aka positional) parameter whose default value is null.
// c is an optional unnamed (aka positional) parameter with a default value.
class MyClass {
  MyClass(this.a, [this.b, this.c = 'default!']) {
    print('a = $a, b = $b, c = $c');
  }
  String a;
  String? b;
  String c;
}

void myFunction(
  String a, [
  String? b,
  String c = 'default!',
]) {
  print('a = $a, b = $b, c = $c');
}

void main() {
  MyClass('a');
  MyClass('a', 'b');
  MyClass('a', 'b', 'c');

  myFunction('a');
  myFunction('a', 'b');
  myFunction('a', 'b', 'c');
}
```

## Example of named parameters
```dart
// a ia a required unnamed parameter.
// b ia a required named parameter.
// c is an optional named parameter whose default value is null.
// d is an optional named parameter with a default value.
class MyClass {
  MyClass(this.a, {required this.b, this.c, this.d = 'default!'}) {
    print('a = $a, b = $b, c = $c, d = $d');
  }
  String a;
  String b;
  String? c;
  String d;
}

void myFunction(
  String a, {
  required String b,
  String? c,
  String d = 'default!',
}) {
  print('a = $a, b = $b, c = $c, d = $d');
}

void main() {
  MyClass('a', b: 'b');
  MyClass('a', b: 'b', c: 'c');
  MyClass('a', b: 'b', c: 'c', d: 'd');

  myFunction('a', b: 'b');
  myFunction('a', b: 'b', c: 'c');
  myFunction('a', b: 'b', c: 'c', d: 'd');
}
```

# How to convert `List<dynamic>` to `List<String>`
```dart
final xs = <dynamic>['a', 'b', 'c'];
print(xs.runtimeType); // List<dynamic>

final ys = List<String>.from(xs);
print(ys.runtimeType); // List<String>

// DON’T use cast() when a nearby operation will do
// https://dart.dev/effective-dart/usage#dont-use-cast-when-a-nearby-operation-will-do
// AVOID using cast()
// https://dart.dev/effective-dart/usage#avoid-using-cast
final zs = xs.cast<String>();
print(zs.runtimeType); // CastList<dynamic, String>
```
