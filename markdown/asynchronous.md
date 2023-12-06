# How to create `async` from nowhere to use `await`
```dart
Future.delayed(
  Duration.zero,
  () async { await ... },
);
```
