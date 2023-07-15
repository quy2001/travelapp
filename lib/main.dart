import 'package:flutter/material.dart';
import 'package:travelapp/core/constants/color_constants.dart';
import 'package:travelapp/representation/screens/splash_screen.dart';
import 'package:travelapp/routes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor:  ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,//gọi đến đường dẫn routes
      onGenerateRoute: generateRoutes,
      home: const SplashScreen(),
    );
  }
}


