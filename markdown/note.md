# Library
> Every Dart file (plus its parts) is a library

https://dart.dev/language/libraries

# StreamController
> If no one listens to a non-broadcast stream, or the listener pauses and never resumes, the done event will not be sent and this future will never complete.

https://api.flutter.dev/flutter/dart-async/StreamController/close.html

```dart
void main() async {
  final streamController = StreamController<void>();
  await streamController.close(); // gets stuck forever because it has no listeners.
  print('StreamController is closed.'); // never prints.
}
```
```dart
void main() async {
  final streamController = StreamController<void>();
  streamController.stream.listen((_) {});
  await streamController.close(); // does not get stuck because it has a listener.
  print('StreamController is closed.'); // prints.
}
```
```dart
void main() async {
  final streamController = StreamController<void>();
  if (streamController.hasListener) {
    await streamController.close();
  }
  print('StreamController is closed.'); // prints.
}
```

# Unnamed extensions 
"The library" written below refers to a Dart file as explained above.
> When declaring an extension, you can omit the name. Unnamed extensions are visible only in the library where they're declared.

https://dart.dev/language/extension-methods#unnamed-extensions
