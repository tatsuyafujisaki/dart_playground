import 'dart:async';

void main() async {
  final streamController = StreamController<String>.broadcast();
  streamController.stream.listen((event) => print('Listening 1: $event'));
  streamController.stream.listen((event) => print('Listening 2: $event'));

  streamController
    ..add('🍎')
    ..add('🍊');

  await streamController.close();
}
