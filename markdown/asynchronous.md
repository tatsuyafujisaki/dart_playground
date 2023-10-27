# How to create `async` to use `await`
```dart
Future.delayed(
  Duration.zero,
  () async { await ... },
);
```