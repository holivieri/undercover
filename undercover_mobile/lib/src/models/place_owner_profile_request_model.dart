import 'dart:convert';

PlaceOwnerProfileRequest placeOwnerProfileRequestFromJson(String str) =>
    PlaceOwnerProfileRequest.fromJson(json.decode(str));

String placeOwnerProfileRequestToJson(PlaceOwnerProfileRequest data) =>
    json.encode(data.toJson());

class PlaceOwnerProfileRequest {
  PlaceOwnerProfileRequest({
    required this.place,
    this.isArtist = false,
    this.isPlaceOwner = true,
  });

  factory PlaceOwnerProfileRequest.fromJson(Map<String, dynamic> json) =>
      PlaceOwnerProfileRequest(
        place: PlaceBasicProfile.fromJson(json['place']),
        isArtist: json['isArtist'],
        isPlaceOwner: json['isPlaceOwner'],
      );

  final PlaceBasicProfile place;
  final bool isArtist;
  final bool isPlaceOwner;

  Map<String, dynamic> toJson() => {
        'place': place.toJson(),
        'isArtist': isArtist,
        'isPlaceOwner': isPlaceOwner,
      };
}

class PlaceBasicProfile {
  PlaceBasicProfile({
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.seats,
    required this.floor,
    required this.streetName,
    required this.streetNumber,
    required this.city,
    required this.province,
    required this.coverPicture,
    required this.country,
    this.standing = 0,
  });

  factory PlaceBasicProfile.fromJson(Map<String, dynamic> json) =>
      PlaceBasicProfile(
        name: json['name'],
        description: json['description'],
        phoneNumber: json['phoneNumber'],
        seats: json['seats'],
        floor: json['floor'],
        streetName: json['streetName'],
        streetNumber: json['streetNumber'],
        city: json['city'],
        province: json['province'],
        coverPicture: json['coverPicture'],
        country: Country.fromJson(
          json['country'],
        ),
        standing: json['standing'],
      );

  final String name;
  final String description;
  final String phoneNumber;
  final int seats;
  final int standing;
  final String floor;
  final String streetName;
  final String streetNumber;
  final String city;
  final String province;
  final String coverPicture;
  final Country country;

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'phoneNumber': phoneNumber,
        'seats': seats,
        'standing': standing,
        'floor': floor,
        'streetName': streetName,
        'streetNumber': streetNumber,
        'city': city,
        'province': province,
        'coverPicture': coverPicture,
        'country': country.toJson(),
      };
}

class Country {
  Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json['id'],
        name: json['name'],
      );

  final String id;
  final String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
