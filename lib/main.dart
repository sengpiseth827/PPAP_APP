import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:ppapapp/screen/content_screen.dart';
import 'package:ppapapp/service/api_service.dart';
import 'package:ppapapp/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) => {
    print("${rec.level.name}: ${rec.time} : ${rec.message}")
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.blueAccent
        ),
        home: SplashScreen(),
      ),
    );
  }
}

