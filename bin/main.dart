DateTime truncateSeconds(DateTime dateTime) => DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
    );

void main() {
  final now = DateTime.now();
  print(now);
  print(truncateSeconds(now));
}
