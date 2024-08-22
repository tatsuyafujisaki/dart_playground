import 'package:intl/intl.dart';

DateTime truncateSeconds(DateTime dateTime) => DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
    );

// 0:00 instead of 00:00
DateFormat createMSsDateFormat() => DateFormat('m:ss');
