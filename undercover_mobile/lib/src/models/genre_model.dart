import 'dart:convert';

import 'artist_model.dart';

List<Genre> genreFromJson(String str) =>
    List<Genre>.from(json.decode(str).map((x) => Genre.fromJson(x)));

String genreToJson(List<Genre> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Genre {
  Genre({
    required this.id,
    required this.name,
    this.artists,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'],
        name: json['name'],
        artists: json['artists'],
      );

  final String id;
  final String name;
  final Artist? artists;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'artists': artists,
      };
}
