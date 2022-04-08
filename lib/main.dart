// import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app_dukantek/providers/auth_provider.dart';
import 'package:test_app_dukantek/services/navigation_service.dart';

import './utils/routes.dart';
import './utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(
    // DevicePreview(
    //     enabled: !kReleaseMode,
    //     builder: (context) =>
    const MyApp(),

    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => MaterialApp(
          title: 'My Story',
          color: Theme.of(context).backgroundColor,
          debugShowCheckedModeBanner: false,
          navigatorKey: locator<NavigationService>().navigatorKey,
          theme: ThemeData(
            backgroundColor: const Color.fromRGBO(31, 106, 247, 1),
            primaryColor: const Color.fromRGBO(
              110,
              115,
              232,
              1,
            ),
            indicatorColor: const Color.fromRGBO(222, 221, 224, 1),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            highlightColor: const Color.fromRGBO(
              110,
              115,
              232,
              1,
            ),
            fontFamily: 'Nunito',
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute: splashScreenRoute,
        ),
      ),
    );
  }
}
