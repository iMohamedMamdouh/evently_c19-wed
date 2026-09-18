import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Future<UserCredential> loginWithGoogle() async {
    var googleUser = await GoogleSignIn.instance.authenticate();
    var googleAuth = googleUser.authentication;
    var credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<UserCredential> login(String email, String password) async {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<UserCredential> register(
    String name,
    String email,
    String password,
  ) async {
    var credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await credential.user?.updateDisplayName(name);
    return credential;
  }

  static Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<void> logout() async {
    await GoogleSignIn.instance.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
