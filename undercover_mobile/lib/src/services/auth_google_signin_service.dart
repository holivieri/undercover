import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

import '../errors/login_error.dart';
import '../models/login_response_model.dart';
import '../utils/http.dart';

class AuthGoogleSignInService {
  void test() {}
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<dynamic> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      print('======== Google Token ========');
      print(account);

      final googleKey = await account!.authentication;

      print('GOOGLE ID TOKEN: ${googleKey.idToken}');

      final _apiResponse = await Client().post(
        Uri.parse(
            '$apiUrl/Authenticate/auth/google?googleTokenId=${googleKey.idToken}'),
        headers: returnUndercoverHeaders(),
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

      //return account;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
