void main() async {
  print('-- Example of "Stream.listen(...)" --');
  await showListenExample();
  print('-- Example of "await for" --');
  await showAwaitForExample();
}

Stream<String> _createStream() => Stream<String>.periodic(
      const Duration(milliseconds: 100),
      (count) => '$count!',
    ).take(3);

Future<void> showListenExample() async {
  print('👀Starts consuming a stream.');
  final subscription = _createStream().listen((data) => print('👀$data'));
  // "Stream.listen(...)" is asynchronous while "await for" is synchronous.
  // Without "await subscription.asFuture(...)",
  // the app will not wait for the stream to finish.
  final result =
      await subscription.asFuture<String>('👀Finishes consuming a stream.');
  print(result);

  await subscription.cancel();
}

Future<void> showAwaitForExample() async {
  print('👀Starts consuming a stream.');
  // "await for" is synchronous while "Stream.listen(...)" is asynchronous.
  await for (final data in _createStream()) {
    print('👀$data');
  }
  print('👀Finishes consuming a stream.');
}
