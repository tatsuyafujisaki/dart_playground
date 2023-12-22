import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String formattedString) => DateTime.parse(formattedString);

  @override
  String toJson(DateTime dateTime) => DateFormat('yyyy-MM-dd').format(dateTime);
}
