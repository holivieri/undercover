import 'dart:convert';

import 'genre_model.dart';

UserProfileRequest userProfileRequestFromJson(String str) =>
    UserProfileRequest.fromJson(json.decode(str));

String userProfileRequestToJson(UserProfileRequest data) =>
    json.encode(data.toJson());

class UserProfileRequest {
  UserProfileRequest({
    required this.user,
    this.isArtist = false,
    this.isPlaceOwner = false,
  });

  factory UserProfileRequest.fromJson(Map<String, dynamic> json) =>
      UserProfileRequest(
        user: User.fromJson(json['user']),
        isArtist: json['isArtist'],
        isPlaceOwner: json['isPlaceOwner'],
      );

  final User user;
  final bool isArtist;
  final bool isPlaceOwner;

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'isArtist': isArtist,
        'isPlaceOwner': isPlaceOwner,
      };
}

class User {
  User({
    this.myGenres,
    this.myArtists,
    this.myPlaces,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        myArtists: json['myArtists'] == null
            ? null
            : List<MyEntity>.from(
                json['myArtists'].map((x) => MyEntity.fromJson(x))),
        myPlaces: json['myPlaces'] == null
            ? null
            : List<MyEntity>.from(
                json['myPlaces'].map((x) => MyEntity.fromJson(x))),
        myGenres: json['myGenres'] == null
            ? null
            : List<Genre>.from(json['myGenres'].map((x) => Genre.fromJson(x))),
      );

  final List<MyEntity>? myArtists;
  final List<MyEntity>? myPlaces;
  final List<Genre>? myGenres;

  Map<String, dynamic> toJson() => {
        'myArtists': myArtists != null
            ? List<dynamic>.from(myArtists!.map((x) => x.toJson()))
            : null,
        'myPlaces': myPlaces != null
            ? List<dynamic>.from(myPlaces!.map((x) => x.toJson()))
            : null,
        'myGenres': myGenres != null
            ? List<dynamic>.from(myGenres!.map((x) => x.toJson()))
            : null
      };
}

class MyEntity {
  MyEntity({
    required this.id,
  });

  factory MyEntity.fromJson(Map<String, dynamic> json) => MyEntity(
        id: json['id'],
      );

  final String id;

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
