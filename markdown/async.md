# When to use which: [await for](https://dart.dev/libraries/async/using-streams#receiving-stream-events) or [Stream.listen](https://api.flutter.dev/flutter/dart-async/Stream/listen.html)
- If you want the app to wait for the stream to finish, use [await for](https://dart.dev/libraries/async/using-streams#receiving-stream-events).
- If you don't, use [Stream.listen](https://api.flutter.dev/flutter/dart-async/Stream/listen.html).

If you use both [Stream.listen](https://api.flutter.dev/flutter/dart-async/Stream/listen.html) and [StreamSubscription.asFuture](https://api.flutter.dev/flutter/dart-async/StreamSubscription/asFuture.html), I recommend replacing them with [await for](https://dart.dev/libraries/async/using-streams#receiving-stream-events).
