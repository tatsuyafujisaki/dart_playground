import 'package:dart_playground/util/timer_util.dart';

void main() async {
  final future1 = Future<String>.delayed(
    const Duration(seconds: 5),
    () => '🍎',
  );

  final future2 = Future<String>.delayed(
    const Duration(seconds: 5),
    () => '🍎',
  );

  final timer = countUp();
  await _showParallelWaitExample(future1, future2);
  await _showSerialWaitExample(future1, future2);
  timer.cancel();
}

// Waits for 5 seconds in total.
Future<void> _showParallelWaitExample(
  Future<String> future1,
  Future<String> future2,
) async {
  final futures = Future.wait<String>([future1, future2]);
  print(await futures);
}

// Waits for 10 seconds in total.
Future<void> _showSerialWaitExample(
  Future<String> future1,
  Future<String> future2,
) async {
  final result1 = await future1;
  final result2 = await future2;
  print([result1, result2]);
}
