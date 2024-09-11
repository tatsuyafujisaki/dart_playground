import 'dart:async';

void main() async {
  final stream = Stream<String>.periodic(
    const Duration(milliseconds: 100),
    (count) => '$count!',
  ).take(3);

  final subscription = stream.listen(print);

  // Waits for the stream to finish.
  final result = await subscription.asFuture<String>('💮');
  print(result); // 💮

  await subscription.cancel();
}
