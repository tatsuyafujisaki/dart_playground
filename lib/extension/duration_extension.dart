extension DurationExtension on Duration {
  String formatInMSs() {
    final hhmmss = toString().split('.').first;
    return hhmmss.substring(3);
  }
}

void main() {
  const duration = Duration(
    hours: 12,
    minutes: 34,
    seconds: 56,
    milliseconds: 123,
    microseconds: 456,
  );
  print(duration); // 12:34:56.123456
  print(duration.formatInMSs()); // 34:56
}
