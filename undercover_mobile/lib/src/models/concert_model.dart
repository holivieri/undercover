import 'place_mode.dart';

class Concert {
  Concert({
    required this.id,
    required this.date,
    required this.place,
  });

  factory Concert.fromJson(Map<String, dynamic> json) => Concert(
        id: json['id'],
        date: DateTime.parse(json['date']),
        place: Place.fromJson(json['place']),
      );

  final String id;
  final DateTime date;
  final Place place;

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'place': place.toJson(),
      };
}
