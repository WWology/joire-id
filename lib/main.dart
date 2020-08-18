import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'constants.dart';
import 'screens/HomeScreen.dart';

FirebaseAnalytics analytics;

void main() {
  analytics = FirebaseAnalytics();

  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kMainThemeColour,
        scaffoldBackgroundColor: kWhiteColour,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextTitleColour),
          bodyText2: TextStyle(color: kTextDetailColour),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
