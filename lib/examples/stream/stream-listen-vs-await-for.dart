import 'dart:async';

void main() async {
  print('-- Example of "Stream.listen(...)" --');
  await main1();
  print('-- Example of "await for" --');
  await main2();
}

Future<void> main1() async {
  final stream = Stream<String>.periodic(
    const Duration(milliseconds: 100),
    (count) => '$count!',
  ).take(3);

  print('👀Starts consuming a stream.');
  final subscription = stream.listen((data) => print('👀$data'));

  await subscription.cancel();
}

Future<void> main2() async {
  final stream = Stream<String>.periodic(
    const Duration(milliseconds: 100),
    (count) => '$count!',
  ).take(3);

  print('👀Starts consuming a stream.');
  await for (final data in stream) {
    print('👀$data');
  }
  print('👀Finishes consuming a stream.');
}
