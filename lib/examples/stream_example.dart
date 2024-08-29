// https://api.flutter.dev/flutter/dart-async/Stream/handleError.html
import 'dart:async';

void main() async {
  StreamSubscription<int>? subscription;

  subscription = Stream.periodic(
    const Duration(milliseconds: 100),
    (count) {
      if (count == 1) {
        throw Exception('💀');
      }
      if (count == 3) {
        subscription?.cancel();
      }
      return count;
    },
  )
      .take(5)
      .handleError(
        (Object error, StackTrace stackTrace) =>
            print('👀handleError: $error\n$stackTrace'),
      )
      .listen(
        (data) => print('👀data: $data'),
        // onError will not be called if "Stream.handleError" is set.
        onError: (Object error, StackTrace stackTrace) =>
            print('👀onError: $error\n$stackTrace'),
        // onDone will not be called if done by cancel.
        onDone: () => print('👀onDone'),
      );
}
