import 'package:flutter/material.dart';
import 'package:weather_app/assets/constants.dart';
import 'package:weather_app/pages/loadingPage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: kThemeData,
      home: const LoadingPage(),
    );
  }
}
