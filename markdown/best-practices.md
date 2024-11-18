# Async
> To catch common mistakes that arise while working with async and futures, enable the following lints:
> - [discarded_futures](https://dart.dev/tools/linter-rules/discarded_futures)
> - [unawaited_futures](https://dart.dev/tools/linter-rules/unawaited_futures)

https://dart.dev/libraries/async/async-await

## Is it good to annotate the `main` function with `async`?
The Dart documentation shows `void main() async` as "GOOD".

> An exception is made for top-level main functions, where the Future annotation can (and generally should) be dropped in favor of void.<br><br>
> GOOD:

```dart
Future<void> f() async {}

void main() async {
  await f();
}
```
https://dart.dev/tools/linter-rules/avoid_void_async

# General

https://dart.dev/tools/linter-rules/avoid_void_async
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
Avoid getting stuck by checking [hasListener](https://api.dart.dev/dart-async/StreamController/hasListener.html) before waiting for a [StreamController](https://api.dart.dev/dart-async/StreamController-class.html) to close.

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

https://api.dart.dev/dart-async/StreamController-class.html

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

# [File](https://api.dart.dev/dart-io/File-class.html)
Use the sync versions of the methods on [File](https://api.dart.dev/dart-io/File-class.html) where `await` is not available.

# Use A instead of B for simplicity
A|B|Note
--|--|--
[VoidCallback](https://api.dart.dev/dart-html/VoidCallback.html)|`void Function()`|Use https://api.flutter.dev/flutter/dart-ui/VoidCallback.html in Flutter.<br>Use https://api.dart.dev/dart-html/VoidCallback.html in pure Dart.
[inspect](https://api.dart.dev/dart-developer/inspect.html)|[debugPrint](https://api.flutter.dev/flutter/foundation/debugPrint.html) or [print](https://api.dart.dev/stable/dart-core/print.html)|
`<E>[]`|[List<E>.empty(growable: true)](https://api.dart.dev/dart-core/List/List.empty.html)
[List<E>.empty()](https://api.dart.dev/dart-core/List/List.empty.html)|`<E>[]`|if the list does not need to be growable.
