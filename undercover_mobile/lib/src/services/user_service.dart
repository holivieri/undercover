import 'dart:convert';

import 'package:http/http.dart';

import '../errors/login_error.dart';
import '../models/login_response_model.dart';
import '../models/user_preferences.dart';
import '../utils/http.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

class UserService {
  String validatePasswordRules(String? password) {
    if (password == null) {
      return 'La clave no puede estar en blanco';
    }
    if (password.length < 6) {
      return 'La clave debe tener 6 o mas caracteres';
    }
    return 'Ok';
  }

  Future<dynamic> login(String userName, String password) async {
    final deviceToken = UserPreferences().deviceToken;
    final platform = UserPreferences().platform;

    final _apiResponse = await Client().post(
      Uri.parse('$apiUrl/Authenticate/Login'),
      headers: returnUndercoverHeaders(),
      body: json.encode({
        'email': userName,
        'password': password,
        'userRole': '',
        'deviceToken': deviceToken,
        'platform': platform,
      }),
    );

    if (_apiResponse.statusCode == 500) {
      return LoginError(
          code: '500', description: 'Internal server error. Try again later');
    }
    if (_apiResponse.statusCode == 400) {
      return LoginError(
          code: '400', description: 'Invalid username or password');
    }

    final LoginResponse user = LoginResponse.fromJson(
      json.decode(
        _apiResponse.body,
      ),
    );

    return user;
  }

  Future<String?> uploadImage(String photoPath) async {
    CloudinaryResponse response;
    try {
      final cloudinary = CloudinaryPublic('holivieri', 'undercover');
      response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          photoPath,
          resourceType: CloudinaryResourceType.Image,
        ),
      );
      return response.secureUrl;
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
      return '';
    }
  }
}
