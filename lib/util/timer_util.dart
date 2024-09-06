import 'dart:async';

void count10() {
  Timer.periodic(
    const Duration(seconds: 1),
    (timer) {
      print('${timer.tick} seconds passed.');
      if (timer.tick == 10) {
        timer.cancel();
      }
    },
  );
}
