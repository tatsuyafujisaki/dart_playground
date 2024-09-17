import 'dart:async';

Timer countUp([void Function(Timer timer)? callback]) => Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        print('${timer.tick} seconds passed.');
        callback?.call(timer);
      },
    );

Timer countUp10() => countUp(
      (timer) {
        if (timer.tick == 10) {
          timer.cancel();
        }
      },
    );
