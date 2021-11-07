import 'country_model.dart';

class Place {
  Place({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.totalCapacity,
    required this.streetName,
    required this.streetNumber,
    required this.city,
    required this.province,
    required this.country,
    this.seats,
    this.standing,
    this.floor,
  });

  final String id;
  final String name;
  final DateTime createdDate;
  final int totalCapacity;
  final int? seats;
  final int? standing;
  final String? floor;
  final String streetName;
  final String streetNumber;
  final String city;
  final String province;
  final Country country;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json['id'],
        name: json['name'],
        createdDate: DateTime.parse(json['createdDate']),
        totalCapacity: json['totalCapacity'],
        seats: json['seats'],
        standing: json['standing'],
        floor: json['floor'],
        streetName: json['streetName'],
        streetNumber: json['streetNumber'],
        city: json['city'],
        province: json['province'],
        country: Country.fromJson(json['country']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'createdDate': createdDate.toIso8601String(),
        'totalCapacity': totalCapacity,
        'seats': seats,
        'standing': standing,
        'floor': floor,
        'streetName': streetName,
        'streetNumber': streetNumber,
        'city': city,
        'province': province,
        'country': country.toJson(),
      };
}
