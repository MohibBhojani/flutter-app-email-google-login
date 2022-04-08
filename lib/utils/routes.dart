import 'package:flutter/material.dart';
import 'package:test_app_dukantek/screens/email_verification_screen.dart';
import 'package:test_app_dukantek/screens/home_screen.dart';

import '../screens/forget_password_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
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
          builder: (BuildContext context) => const LoginScreen());

    case forgetPasswordScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ForgetPasswordScreen());

    case signUpScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpScreen());

    case homeScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen());

    case emailVerificationScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const EmailVerificationScreen());

    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen());
  }
}
