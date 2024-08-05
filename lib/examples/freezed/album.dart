import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    required int? userId,
    int? id,
    String? title,
  }) = _Album;

  factory Album.fromJson(Map<String, Object?> json) => _$AlbumFromJson(json);
}

void main() {
  const album = Album(userId: 1, id: 2, title: 'Title');
  final map = album.toJson();
  print(map);
  print(album.fromJson(map));
  print(jsonEncode(album)); // jsonEncode implicitly calls toJson.
}
