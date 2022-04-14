import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_dukantek/providers/auth_provider.dart';
import 'package:test_app_dukantek/utils/routes.dart';

import '../services/storage_service.dart';
import '../services/navigation_service.dart';
import '../utils/service_locator.dart';
// import '../widgets/exit_alert_dialog.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var navigationService = locator<NavigationService>();
  var storageService = locator<StorageService>();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Provider.of<AuthProvider>(context, listen: false).checkUserLogin();
      if (AuthUserLogin.isLogin) {
        navigationService.navigateTo(homeScreenRoute);
      } else {
        navigationService.navigateTo(loginScreenRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: null,
        child: Stack(
            // fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo_app.png'),
                      scale: 1),
                ),
              ),
            ]),
      ),
    );
  }
}
