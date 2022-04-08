import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'storage_service.dart';
import 'navigation_service.dart';
import 'util_service.dart';
import '../utils/service_locator.dart';
import '../utils/routes.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UtilService _util = locator<UtilService>();
  final NavigationService _navigation = locator<NavigationService>();
  final StorageService _storage = locator<StorageService>();

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      _util.showToast(
        "An email has been sent please follow the instructions and recover your password.",
      );
      _navigation.navigateTo(loginScreenRoute);
    } on FirebaseAuthException catch (err) {
      _util.showToast(
        err.message.toString(),
      );
    }
  }

  Future<void> logoutFirebaseUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    await _storage.clearData();
  }

  sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      user!.sendEmailVerification();
      _util.showToast(
        "A Verification email has been sent",
      );
    } catch (err) {
      print(err);
    }
  }

  resendEmailVerification() async {
    final user = _auth.currentUser;
    await user!.sendEmailVerification();
    _util.showToast(
      "A Verification Link Resend to your email kindly check your inbox",
    );
  }

  createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
      }

      return auth;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _util.showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _util.showToast('The account already exists for that email.');
      } else {
        _util.showToast('Failed with error code: ${e.code}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  signInUserWithEmailAndPassword(String email, String password) async {
    try {
      final auth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return auth;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _util.showToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _util.showToast('Wrong password provided for that user.');
      } else {
        _util.showToast('Failed with error code: ${e.code}');
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
