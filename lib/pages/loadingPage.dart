// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weather_app/pages/weatherPage.dart';
import 'package:weather_app/utils/weatherHelper.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    WeatherHelper weatherHelper = WeatherHelper();
    await weatherHelper.updateWeatherInformation(true);

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherPage(
            weatherHelper: weatherHelper,
          ),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
