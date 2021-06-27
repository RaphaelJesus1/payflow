import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/models/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/models/home/home_page.dart';
import 'package:payflow/models/splash/splash_page.dart';

import 'models/login/login_page.dart';
import 'shared/themes/app-colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pay Flow',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: AppColors.primary,
        ),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashPage(),
          "/home": (context) => HomePage(),
          "/login": (context) => LoginPage(),
          "/barcode_scanner": (context) => BarcodeScannerPage()
        });
  }
}
