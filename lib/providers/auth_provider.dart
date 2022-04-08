import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_dukantek/services/storage_service.dart';
import 'package:test_app_dukantek/utils/routes.dart';

import '../constants/enums.dart';
import '../models/appuser.dart';
import '../services/firebase_service.dart';
import '../services/navigation_service.dart';
import '../services/util_service.dart';
import '../utils/service_locator.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseService? _firebase = locator<FirebaseService>();
  NavigationService? navigationService = locator<NavigationService>();
  UtilService? utilService = locator<UtilService>();
  StorageService storageService = locator<StorageService>();

  AppUser? appUser = AppUser();

  get user {
    return appUser;
  }

  setuser(AppUser user) {
    appUser = user;
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebase!.signInUserWithEmailAndPassword(email.trim(), password);
      final firebaseUser = FirebaseAuth.instance.currentUser;

      appUser = AppUser(
          email: firebaseUser!.email,
          id: firebaseUser.uid,
          fullName: firebaseUser.displayName);
      print(firebaseUser.email);
      if (firebaseUser.emailVerified) {
        navigationService!.navigateTo(homeScreenRoute);
      } else {
        resendVerificationEmail();
        navigationService!.navigateTo(emailVerificationScreenRoute);
      }
    } catch (e) {
      utilService!.showToast('Something went wrong!');
    }
  }

  checkUserLogin() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      AuthUserLogin.isLogin = false;
    } else {
      AuthUserLogin.isLogin = true;
      appUser = AppUser(
        email: firebaseUser.email,
        id: firebaseUser.uid,
      );
      if (await storageService
          .haveBoolData(StorageKeys.isGoogleLogin.toString())) {
        AuthUserLogin.isLoginGoogle = true;
      }
    }
  }

  signInWithGoogle() async {
    try {
      await _firebase!.signInWithGoogle();
      final firebaseUser = FirebaseAuth.instance.currentUser;
      appUser = AppUser(
        email: firebaseUser!.email,
        id: firebaseUser.uid,
        fullName: firebaseUser.displayName
      );
      print(firebaseUser.email);

      storageService.setBoolData(StorageKeys.isGoogleLogin.toString(), true);
      AuthUserLogin.isLoginGoogle = true;
      navigationService!.navigateTo(homeScreenRoute);
    } catch (e) {
      utilService!.showToast('Something went wrong!');
    }
  }

  logoutFirebase() async {
    await FirebaseAuth.instance.signOut();
    var storage = await SharedPreferences.getInstance();
    storage.clear();
    navigationService!.navigateTo(loginScreenRoute);
  }

  createUserWithEmailAndPassword(
      String name, String email, String password) async {
    await _firebase!.createUserWithEmailAndPassword(name, email, password);
    await _firebase!.sendEmailVerification();
    appUser!.email = email;
    navigationService!.navigateTo(emailVerificationScreenRoute);
  }

  resendVerificationEmail() async {
    await _firebase!.resendEmailVerification();
  }

  forgotPassword(String email) async {
    await _firebase!.forgotPassword(email);
  }
}

class AuthUserLogin {
  static bool isLogin = false;
  static bool isLoginGoogle = false;
}
