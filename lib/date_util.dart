import 'package:intl/intl.dart';

/// Converts a [DateTime] to a [String] with a given pattern.
///
/// Example:
/// convertDateTimeToString() // today in yyyy-MM-dd
/// convertDateTimeToString(dateTime: DateTime(2018, 7, 18)) // 2018-07-18
/// convertDateTimeToString(newPattern: 'MM-dd-yyyy') // today in MM-dd-yyyy
String convertDateTimeToString({
  DateTime? dateTime,
  String newPattern = 'yyyy-MM-dd hh:mm:ss',
}) =>
    DateFormat(newPattern).format(dateTime ?? DateTime.now());
