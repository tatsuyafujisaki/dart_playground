# How to print the Dart version
```dart
print(Platform.version); // x.x.x (stable)
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

# List
## How to clone (deep copy) a List
```dart
final list1 = <String>['🍎', '🍊'];
final list2 = List<String>.from(list1);
list2[0] = '🍏';
print(list1); // [🍎, 🍊]
print(list2); // [🍏, 🍊]
```

## How to convert `List<dynamic>` to `List<String>`
```dart
final list1 = <dynamic>['🍎'];
print(list1.runtimeType); // List<dynamic>

final list2 = List<String>.from(list1);
print(list2.runtimeType); // List<String>

// Not recommended way:
// > DON'T use cast() when a nearby operation will do
// https://dart.dev/effective-dart/usage#dont-use-cast-when-a-nearby-operation-will-do
// > AVOID using cast()
// https://dart.dev/effective-dart/usage#avoid-using-cast
final list3 = list1.cast<String>().toList();
print(list3.runtimeType); // List<String>
```

# Difference between List and UnmodifiableListView
Operation|List|UnmodifiableListView
--|--|--
Can add or remove an item?|Yes|No
Can replace an item?|Yes|No

## Example of add/remove/modify on List
```dart
void main() {
  final fruits = ['🍎']
    ..remove('🍎')
    ..add('🍏');

  fruits[0] = '🍊';
  print(fruits); // ['🍊'];
}
```

## Example of add/remove/modify on UnmodifiableListView
```dart
void main() {
  final fruits = UnmodifiableListView(['🍎']);

  // throws "Unsupported operation: Cannot add to an unmodifiable list".
  // fruits.add('🍏');

  // throws "Unsupported operation: Cannot remove from an unmodifiable list".
  // fruits.remove('🍎');

  // throws "Unsupported operation: Cannot modify an unmodifiable list".
  // fruits[0] = '🍏';
}
```

# Set
## How to clone (deep copy) a Set
```dart
final set1 = <String>{'🍎', '🍊'};
final set2 = Set<String>.from(set1)
  ..remove('🍎')
  ..add('🍏');
print(set1); // {🍎, 🍊}
print(set2); // {🍊, 🍏}
```

# Map
## How to clone (deep copy) a Map
```dart
final map1 = <String, String>{'apple': '🍎', 'orange': '🍊'};
final map2 = Map<String, String>.from(map1);
map2['apple'] = '🍏';
print(map1); // {apple: 🍎, orange: 🍊}
print(map2); // {apple: 🍏, orange: 🍊}
```

# Example of [FutureOr](https://api.dart.dev/stable/dart-async/FutureOr-class.html)
```dart
import 'dart:async';

final _cache = <String, FutureOr<String>>{};

FutureOr<String> fetchData(String key) async {
  if (_cache.containsKey(key)) {
    return _cache[key]!;
  }
  final data =
      await Future.delayed(const Duration(seconds: 1), () => 'Data for $key');
  _cache[key] = data;
  return data;
}

void main() async {
  final data1 = await fetchData('key1');
  print(data1); // Data for key1

  final data2 = await fetchData('key1');
  print(data2); // Data for key1
}
```

# Example of `??=`
```dart
String? apple1 = '🍎';
String? apple2;

apple1 ??= '🍏';
apple2 ??= '🍏';

print(apple1); // 🍎
print(apple2); // 🍏
```

# Example of division, quotient, and remainder
```dart
print(10 / 3); // 3.33..
print(10 ~/ 3); // 3
print(10 % 3); // 1
```

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

# Test
[test.md](markdown/test.md)

# Best practices
[best-practices.md](markdown/best-practices.md)
