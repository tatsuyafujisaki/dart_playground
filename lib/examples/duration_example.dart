// ignore: unreachable_from_main
String formatInMSs(Duration duration) {
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds.toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

void main() {
  const duration = Duration(
    hours: 12,
    minutes: 34,
    seconds: 56,
    milliseconds: 123,
    microseconds: 456,
  );
  print(duration);
}
