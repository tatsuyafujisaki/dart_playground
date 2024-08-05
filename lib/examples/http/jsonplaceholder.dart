import 'dart:convert';
import 'dart:io';

import 'package:dart_playground/examples/freezed/album.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'jsonplaceholder.typicode.com';

// ignore: unused_element
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

// ignore: unused_element
Future<Album> _getAlbum({required int id}) async {
  final uri = Uri.https(_baseUrl, 'albums/$id');
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to get an album.');
  }
}

/// https://docs.flutter.dev/cookbook/networking/send-data#convert-the-http-response-to-an-album
// ignore: unused_element
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

/// https://docs.flutter.dev/cookbook/networking/delete-data#2-delete-data-on-the-server
// ignore: unused_element
Future<void> _deleteAlbum({required int id}) async {
  final uri = Uri.https(_baseUrl, 'albums/$id');
  final response = await http.delete(
    uri,
    headers: <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.toString(),
    },
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to delete an album.');
  }
}

void main() async {
  // print(await _getAlbums());
  // print(await _getAlbum(id: 1));
  // print(await _createAlbum());
  await _deleteAlbum(id: 1);
}
