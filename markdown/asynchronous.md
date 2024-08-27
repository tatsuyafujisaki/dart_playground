# How to create `async` from nowhere to use `await`
## Option 1
Use [FutureBuilder](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html).
```dart
FutureBuilder<String>(
  future: myFuture,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data!);
    } else if (snapshot.hasError) {
      return Text(snapshot.error!.toString());
    } else {
      return Text(...);
    }
  },
)
```

## Option 2
Use [WidgetsBinding.instance.addPostFrameCallback](https://api.flutter.dev/flutter/scheduler/SchedulerBinding/addPostFrameCallback.html).
```dart
WidgetsBinding.instance.addPostFrameCallback(
  (_) async =>  myAsyncFunction(),
);
```

## Option 3
Use [Future.delayed](https://api.flutter.dev/flutter/dart-async/Future/Future.delayed.html).
```dart
Future.delayed(
  Duration.zero,
  () async => myAsyncFunction(),
);
```
