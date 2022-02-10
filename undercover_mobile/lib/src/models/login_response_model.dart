import 'dart:convert';

LoginResponse userFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String userToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.userId,
    required this.userName,
    required this.token,
    required this.expiration,
    required this.userProfile,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json['userId'],
        userName: json['userName'],
        token: json['token'],
        expiration: DateTime.parse(json['expiration']),
        userProfile: json['userProfile'],
      );

  final String userId;
  final String userName;
  final String token;
  final DateTime expiration;
  final String userProfile;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'token': token,
        'expiration': expiration.toIso8601String(),
        'userProfile': userProfile,
      };
}
