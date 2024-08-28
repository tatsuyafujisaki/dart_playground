// Returns 34:56 if Duration is 12:34:56.123456
String formatInMSs(Duration duration) =>
    duration.toString().split('.').first.substring(3);

void main() {
  const duration = Duration(
    hours: 12,
    minutes: 34,
    seconds: 56,
    milliseconds: 123,
    microseconds: 456,
  );
  print(duration); // 12:34:56.123456
  print(formatInMSs(duration)); // 34:56
}
