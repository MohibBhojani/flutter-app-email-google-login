import 'package:flutter/material.dart';
import 'package:test_app_dukantek/screens/email_verification_screen.dart';
import 'package:test_app_dukantek/screens/maindeshboard_screen.dart';

import '../screens/forget_password_new.dart';
import '../screens/login_screen.dart';
import '../screens/login_screen_new.dart';
import '../screens/signup_screen_new.dart';
import '../screens/splash_screen.dart';

const splashScreenRoute = '/splash-screen';
const loginScreenRoute = '/login-screen';
const signUpScreenRoute = '/signup-screen';
const forgetPasswordScreenRoute = '/forgetPassword-Screen';
const homeScreenRoute = '/home-screen';
const emailVerificationScreenRoute = '/email-verification-screen';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen());

    case loginScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) =>  LogInScreen());

    case forgetPasswordScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ForgetPasswordScreen());

    case signUpScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) =>  SignupScreen());

    case homeScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) =>  const MainDeshboardScreen());

    case emailVerificationScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const EmailVerificationScreen());

    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen());
  }
}
