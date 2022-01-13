import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogleSignInService {
  void test() {}
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      print('======== Google Token ========');
      print(account);

      final googleKey = await account!.authentication;

      print('GOOGLE ID TOKEN: ${googleKey.idToken}');

      //TODO llamar al backend

      return account;
    } on Exception catch (error) {
      print(error);
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
