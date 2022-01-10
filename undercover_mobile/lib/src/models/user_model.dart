import 'dart:convert';

import 'artist_model.dart';
import 'place_model.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.myArtists,
    required this.myPlaces,
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        myArtists:
            List<Artist>.from(json['myArtists'].map((x) => Artist.fromJson(x))),
        myPlaces:
            List<Place>.from(json['myPlaces'].map((x) => Place.fromJson(x))),
        id: json['id'],
        userName: json['userName'],
        normalizedUserName: json['normalizedUserName'],
        email: json['email'],
        normalizedEmail: json['normalizedEmail'],
        emailConfirmed: json['emailConfirmed'],
      );

  final List<Artist> myArtists;
  final List<Place> myPlaces;
  final String id;
  final String userName;
  final String normalizedUserName;
  final String email;
  final String normalizedEmail;
  final bool emailConfirmed;

  Map<String, dynamic> toJson() => {
        'myArtists': List<dynamic>.from(myArtists.map((x) => x.toJson())),
        'myPlaces': List<dynamic>.from(myPlaces.map((x) => x.toJson())),
        'id': id,
        'userName': userName,
        'normalizedUserName': normalizedUserName,
        'email': email,
        'normalizedEmail': normalizedEmail,
        'emailConfirmed': emailConfirmed,
      };
}
