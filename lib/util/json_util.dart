import 'dart:convert';

class JsonUtils {
  static List<T> parse<T>(
    String json,
    T Function(Map<String, dynamic> json) converter,
  ) =>
      List<Map<String, dynamic>>.from(jsonDecode(json) as Iterable)
          .map(converter)
          .toList();
}
