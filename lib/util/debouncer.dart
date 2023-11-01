import 'dart:async';

class Debouncer {
  Debouncer({required this.milliseconds});
  final int milliseconds;
  Timer? _timer;

  void run(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}

void main() {
  Debouncer(milliseconds: 3000).run(() => print('3 seconds passed.'));
  print('0 second passed.');
}
