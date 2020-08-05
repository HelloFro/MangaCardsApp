import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // TODO: sign-in with email/pass

  // TODO: sign-in with google

  // TODO: sign-in with MAL
  Future signInMAL() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // TODO: Register with email/pass

  // TODO: sign-out

}