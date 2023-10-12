import 'package:intl/intl.dart';

/// Converts a [DateTime] to a [String] with a given pattern.
///
/// Example:
/// convertToString() // today in yyyy-MM-dd
/// convertToString(dateTime: DateTime(2018, 7, 18)) // 2018-07-18
/// convertToString(newPattern: 'MM-dd-yyyy') // today in MM-dd-yyyy
String convertToString({
  DateTime? dateTime,
  String newPattern = 'yyyy-MM-dd hh:mm:ss',
}) =>
    DateFormat(newPattern).format(dateTime ?? DateTime.now());
