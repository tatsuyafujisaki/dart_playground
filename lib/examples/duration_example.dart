void main() {
  const duration = Duration(
    hours: 12,
    minutes: 34,
    seconds: 56,
    milliseconds: 123,
    microseconds: 456,
  );
  print(duration); // 12:34:56.123456

  final hhmmss = duration.toString().split('.').first;
  print(hhmmss); // 12:34:56

  final mmss = hhmmss.substring(3);
  print(mmss); // 34:56
}
