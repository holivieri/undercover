import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart';

import '../errors/login_error.dart';
import '../models/login_response_model.dart';
import '../models/user_preferences.dart';
import '../models/user_profile_request_model.dart';
import '../utils/http.dart';

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

  void saveUserProfileToLocal(String profile) {
    switch (profile) {
      case 'user':
        UserPreferences().profile = MyProfile.user;
        break;
      case 'artist':
        UserPreferences().profile = MyProfile.artist;
        break;
      case 'owner':
        UserPreferences().profile = MyProfile.owner;
        break;
      default:
        UserPreferences().profile = MyProfile.none;
        break;
    }
  }

  Future<bool> createNewUserProfile(
    UserProfileRequest userProfile,
  ) async {
    final _apiResponse = await Client().post(
      Uri.parse('$apiUrl/User/CreateProfile'),
      headers: returnUndercoverHeaders(),
      body: jsonEncode(userProfile),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'CreateProfile endpoint is NOT working',
      );
      return false;
    }
    UserPreferences().profile = MyProfile.user;
    return true;
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

    UserService().saveUserProfileToLocal(user.userProfile);

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
