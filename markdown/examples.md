# Example of a class that contains an instance variable with the default parameter [DateTime.now](https://api.flutter.dev/flutter/dart-core/DateTime/DateTime.now.html)?
```dart
class MyClass {
  final DateTime dateTime;

  MyClass({DateTime? dateTime}) : dateTime = dateTime ?? DateTime.now();
}
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

# Example of division, quotient, and remainder
```dart
print(10 / 3); // 3.33..
print(10 ~/ 3); // 3
print(10 % 3); // 1
```
