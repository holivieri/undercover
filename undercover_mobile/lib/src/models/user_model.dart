import 'dart:convert';

//TODO should be UserResponse?

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.userId,
    required this.userName,
    required this.token,
    required this.expiration,
    required this.userRoles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['userId'],
        userName: json['userName'],
        token: json['token'],
        expiration: DateTime.parse(json['expiration']),
        userRoles: json['userRoles'],
      );

  final String userId;
  final String userName;
  final String token;
  final DateTime expiration;
  final String userRoles;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'token': token,
        'expiration': expiration.toIso8601String(),
        'userRoles': userRoles,
      };
}
