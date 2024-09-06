import 'dart:async';

import 'package:dart_playground/util/timer_util.dart';

class Debouncer {
  Debouncer(this.duration, this.callback);
  final Duration duration;
  void Function() callback;
  Timer? _timer;

  void run() {
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }
}

void main() {
  final debouncer = Debouncer(
    const Duration(seconds: 3),
    () => print('Debouncer: 3 seconds passed without another call.'),
  );

  count10();

  Timer(
    const Duration(seconds: 2),
    debouncer.run,
  );

  Timer(
    const Duration(seconds: 4),
    debouncer.run,
  );
}
