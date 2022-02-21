import 'country_model.dart';

class Place {
  Place({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.totalCapacity,
    required this.streetName,
    required this.city,
    required this.province,
    required this.country,
    required this.likes,
    required this.dislikes,
    this.seats,
    this.standing,
    this.floor,
    this.coverPicture,
    this.description,
    this.phoneNumber,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
      id: json['id'],
      name: json['name'],
      createdDate: DateTime.parse(json['createdDate']),
      totalCapacity: json['totalCapacity'],
      seats: json['seats'],
      standing: json['standing'],
      floor: json['floor'],
      streetName: json['streetName'],
      city: json['city'],
      province: json['province'],
      country: Country.fromJson(json['country']),
      coverPicture: json['coverPicture'],
      description: json['description'],
      likes: json['likes'],
      dislikes: json['dislikes'],
      phoneNumber: json['phoneNumber']);

  final String id;
  final String name;
  final DateTime createdDate;
  final int totalCapacity;
  final int? seats;
  final int? standing;
  final String? floor;
  final String streetName;
  final String city;
  final String province;
  final Country country;
  final String? coverPicture;
  final String? description;
  final int likes;
  final int dislikes;
  final String? phoneNumber;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'createdDate': createdDate.toIso8601String(),
        'totalCapacity': totalCapacity,
        'seats': seats,
        'standing': standing,
        'floor': floor,
        'streetName': streetName,
        'city': city,
        'province': province,
        'country': country.toJson(),
        'coverPicture': coverPicture,
        'description': description,
        'likes': likes,
        'dislikes': dislikes,
        'phoneNumber': phoneNumber,
      };
}
