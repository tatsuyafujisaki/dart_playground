import 'package:dart_playground/util/timer_util.dart';

void main() async {
  print('Future.wait example:');
  await _showFutureWaitExample();
  print('Not Future.wait example:');
  await _showNonFutureWaitExample();
}

Future<String> _createFuture() => Future<String>.delayed(
      const Duration(seconds: 10),
      () => '🍎',
    );

// Waits for 5 seconds in total.
Future<void> _showFutureWaitExample() async {
  final timer = countUp();
  final future1 = _createFuture();
  final future2 = _createFuture();
  final futures = Future.wait<String>([future1, future2]);
  print(await futures);
  timer.cancel();
}

// Waits for 5 seconds in total.
Future<void> _showNonFutureWaitExample() async {
  final timer = countUp();
  final future1 = _createFuture();
  final future2 = _createFuture();
  final result1 = await future1;
  final result2 = await future2;
  print([result1, result2]);
  timer.cancel();
}
