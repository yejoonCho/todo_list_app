import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginNotifier extends ChangeNotifier {
  LoginNotifier() {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        isLogged = true;
        notifyListeners();
      } else {
        isLogged = false;
        notifyListeners();
      }
    });
  }

  bool isLogged = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  Future<void> loginWithGoogle() async {
    final _googleUser = await _googleSignIn.signIn();
    final _googleAuth = await _googleUser!.authentication;
    final _credential = GoogleAuthProvider.credential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(_credential);
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
