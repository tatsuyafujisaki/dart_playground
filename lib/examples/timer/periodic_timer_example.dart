import 'dart:async';

Timer createAndStartPeriodicTimer([void Function()? callback]) =>
    Timer.periodic(
      const Duration(seconds: 1) /* inteval */,
      (timer) {
        print('Timer.tick: ${timer.tick}');
        callback?.call();
      },
    );

void main() {
  final timer = createAndStartPeriodicTimer(
    () => print(DateTime.now()),
  );

  Future<void>.delayed(
    const Duration(seconds: 3),
    timer.cancel,
  );
}
