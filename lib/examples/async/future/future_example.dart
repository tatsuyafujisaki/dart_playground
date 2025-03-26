void main() async {
  final future1 = Future<String>.value('🍎');
  final future2 = Future<String>.error('☠️');

  await _printFuture(future1);
  await _printFuture(future2);
  await _printFuture(future1, deliberatelyThrowErrorInsideThen: true);
}

Future<void> _printFuture<T>(
  Future<T> future, {
  bool deliberatelyThrowErrorInsideThen = false,
}) async {
  await future.then(
    (value) {
      if (deliberatelyThrowErrorInsideThen) {
        throw Exception('This exception originate in `then`.');
      }
      print('then: $value');
    },
    onError: (Object? error) {
      print('then.onError: $error');
    },
  ).catchError(
    (Object? error) {
      print('catchError: $error');
    },
  );
}
