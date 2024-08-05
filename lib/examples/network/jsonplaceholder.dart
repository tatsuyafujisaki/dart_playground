import 'dart:convert';

import 'package:dart_playground/examples/freezed/album.dart';
import 'package:dart_playground/util/json/json.dart';
import 'package:http/http.dart' as http;

void main() async {
  final uri = Uri.https('jsonplaceholder.typicode.com', 'albums/1');
  final response = await http.get(uri);
  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.body}');
  print('Minified response body: ${minifyJson(response.body)}');
  final map = jsonDecode(response.body) as Map<String, dynamic>;
  print('Map created from string: $map');
  final album = Album.fromJson(map);
  print('Album: $album');
  print('Map created from Album: ${album.toJson()}');
}
