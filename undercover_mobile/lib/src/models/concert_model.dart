import 'artist_model.dart';
import 'place_model.dart';

class Concert {
  Concert({
    required this.id,
    required this.date,
    required this.place,
    this.artist,
  });

  factory Concert.fromJson(Map<String, dynamic> json) => Concert(
        id: json['id'],
        date: DateTime.parse(json['date']),
        place: Place.fromJson(json['place']),
        artist: json['artist'] == null ? null : Artist.fromJson(json['artist']),
      );

  final String id;
  final DateTime date;
  final Place place;
  final Artist? artist;

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'place': place.toJson(),
        'artist': artist!.toJson(),
      };
}
