# General
## Ensure that your packages depend on the freshest versions of packages when possible.
> Be proactive in managing your dependencies. Ensure that your packages depend on the freshest versions of packages when possible. If your package depends on a stale package, that stale package may depend on other stale packages in its dependency tree. Stale versions of packages can have a negative impact on the stability, performance, and quality of your app.

https://dart.dev/tools/pub/dependencies#best-practices

## Don't commit generated files.
- https://dart.dev/guides/libraries/private-files
  - > don’t include most of the files that your IDE or code editor, the pub tool, and other tools generate.
  - > In many source code repositories, the common practice is not to commit generated files, at all.

## Stream
- https://dart.dev/libraries/async/creating-streams#final-hints
  - > Don't try to implement the Stream interface yourself.
  - > Although it's possible to create classes that extend Stream with more functionality by extending the Stream class and implementing the listen method and the extra functionality on top, that is generally not recommended because it introduces a new type that users have to consider.

## StreamController
Avoid getting stuck by checking [hasListener](https://api.dart.dev/stable/dart-async/StreamController/hasListener.html) before waiting for a [StreamController](https://api.dart.dev/stable/dart-async/StreamController-class.html) to close.

```dart
void main() async {
  final streamController = StreamController<void>();
  // streamController.stream.listen((_) {});
  await streamController.close(); // gets stuck because it has no listeners.
  print('This never prints.');
}
```
```dart
void main() async {
  final streamController = StreamController<void>();
  if (streamController.hasListener) {
    await streamController.close();
  }
  print('This prints.');
}
```

> If no one listens to a non-broadcast stream, or the listener pauses and never resumes, the done event will not be sent and this future will never complete.

https://api.dart.dev/stable/dart-async/StreamController-class.html

## Use `final List` instead of `var List`
BAD:
```dart
var fruits = ['🍎', '🍊'];
fruits = ['🍏', '🍇'];
print(fruits); // [🍏, 🍇]
```

GOOD:
```dart
final fruits = ['🍎', '🍊'];
fruits.clear();
fruits.addAll(['🍏', '🍇']);
print(fruits); // [🍏, 🍇]
```

# Use A instead of B for simplicity
A|B|Note
--|--|--
[VoidCallback](https://api.dart.dev/stable/3.5.1/dart-html/VoidCallback.html)|void Function()|Use https://api.flutter.dev/flutter/dart-ui/VoidCallback.html in Flutter.<br>Use https://api.dart.dev/stable/dart-html/VoidCallback.html in pure Dart.
[whenComplete](https://api.flutter.dev/flutter/dart-async/Future/whenComplete.html)|[then](https://api.flutter.dev/flutter/dart-async/Future/then.html)|if the [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) returns nothing.
`TimeOfDay.now()`|`DateTime.now()`|if what you want is only hours and minutes.
`inspect(myObject)`|`debugPrint(myObject)`|https://api.dart.dev/stable/dart-developer/inspect.html
