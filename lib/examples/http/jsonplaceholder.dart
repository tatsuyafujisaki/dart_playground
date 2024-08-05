import 'dart:convert';
import 'dart:io';

import 'package:dart_playground/examples/freezed/album.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'jsonplaceholder.typicode.com';

Future<Iterable<Album>> _getAlbums() async {
  final uri = Uri.https(_baseUrl, 'albums');
  final response = await http.get(uri);
  if (response.statusCode != 200) {
    final mapList = jsonDecode(response.body) as List<dynamic>;
    return mapList.map((map) => Album.fromJson(map as Map<String, dynamic>));
  } else {
    throw Exception('Failed to get albums.');
  }
}

Future<Album> _getAlbum() async {
  final uri = Uri.https(_baseUrl, 'albums/1');
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to get an album.');
  }
}

/// https://docs.flutter.dev/cookbook/networking/send-data#convert-the-http-response-to-an-album
Future<Album> _createAlbum() async {
  final uri = Uri.https(_baseUrl, 'albums');
  final response = await http.post(
    uri,
    headers: <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.toString(),
    },
    body: jsonEncode(
      <String, dynamic>{
        'userId': 42,
        'title': 'MyTitle',
      },
    ),
  );
  if (response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create an album.');
  }
}

void main() async {
  // print(await _getAlbums());
  // print(await _getAlbum());
  print(await _createAlbum());
}
