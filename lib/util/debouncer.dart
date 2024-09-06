import 'dart:async';

import 'package:dart_playground/util/timer_util.dart';

class Debouncer {
  Debouncer(this.duration);
  final Duration duration;
  Timer? _timer;

  void run(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }
}

void main() {
  final debouncer = Debouncer(const Duration(seconds: 3));

  count10();

  Timer(
    const Duration(seconds: 2),
    () => debouncer.run(
      () => print('Debouncer: 2 seconds passed without another call.'),
    ),
  );

  Timer(
    const Duration(seconds: 4),
    () => debouncer.run(
      () => print('Debouncer: 4 seconds passed without another call.'),
    ),
  );
}
