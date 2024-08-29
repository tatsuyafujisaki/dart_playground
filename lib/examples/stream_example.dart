// https://api.flutter.dev/flutter/dart-async/Stream/handleError.html
void main() async {
  Stream.periodic(
    const Duration(milliseconds: 100),
    (count) {
      if (count == 1) {
        throw Exception('💀');
      }
      return count;
    },
  )
      .take(10)
      .handleError(
        (Object error, StackTrace stackTrace) =>
            print('handleError: $error\n$stackTrace'),
      )
      .listen(
        (data) => print('👀data: $data'),
        // onError will not be called if "Stream.handleError" is set.
        onError: (Object error, StackTrace stackTrace) =>
            print('👀onError: $error\n$stackTrace'),
        onDone: () => print('👀onDone'),
      );
}
