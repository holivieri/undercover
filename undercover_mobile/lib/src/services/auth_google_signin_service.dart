import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogleSignInService {
  void Test() {}
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      print(account);
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
