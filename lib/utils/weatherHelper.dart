// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/widgets/customWeatherIcon.dart';
import 'package:weather_icons/weather_icons.dart';

import '../assets/constants.dart';
import '../services/apiKey.dart';
import '../services/location.dart';
import '../services/network.dart';

class WeatherHelper {
  dynamic weatherData;

  Weather weather = Weather();
  Future<int> getWeatherFromCity(String cityName) async {
    Location location = Location();
    await location.getLocation();
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
    var data = await network.getData();
    try {
      if (data['cod'] == 200) {
        weatherData = data;

        updateWeatherInformation(false);
        return 200;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return 404;
  }

  updateWeatherInformation(bool CurrentLocation) async {
    try {
      if (CurrentLocation) {
        await _getCurrentLocationWeather();
      }

      var temperature = weatherData['main']['temp'] - 272;
      weatherData = weather.setWeatherValues(
        weatherData['name'],
        temperature.toInt(),
        weatherData['cod'],
      );
    } catch (e) {
      weatherData = weather.setWeatherValues('Error', 0, 999);
    }
  }

  Future<dynamic> _getCurrentLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.lon}&appid=$apiKey');
    weatherData = await network.getData();
  }

  getWeatherIcon() {
    if (weather.conditionCode < 300) {
      return CustomWeatherIcon(iconData: WeatherIcons.thunderstorm);
    } else if (weather.conditionCode < 400) {
      return CustomWeatherIcon(iconData: WeatherIcons.raindrop);
    } else if (weather.conditionCode < 600) {
      return CustomWeatherIcon(iconData: WeatherIcons.rain);
    } else if (weather.conditionCode < 700) {
      return CustomWeatherIcon(iconData: WeatherIcons.snow);
    } else if (weather.conditionCode < 800) {
      return CustomWeatherIcon(iconData: WeatherIcons.wind);
    } else if (weather.conditionCode == 800) {
      return CustomWeatherIcon(iconData: WeatherIcons.sunset);
    } else if (weather.conditionCode <= 804) {
      return CustomWeatherIcon(iconData: WeatherIcons.cloud);
    } else {
      return CustomWeatherIcon(iconData: Icons.question_mark);
    }
  }

  TextSpan getMessage() {
    if (weather.temperature > 25) {
      return TextSpan(
        children: [
          TextSpan(
            text: "Time for swim! ",
            style: kTextStyle.copyWith(
              color: Colors.white70,
              fontSize: 20,
            ),
          ),
          const WidgetSpan(
            child: Icon(
              Icons.pool,
              color: Colors.white,
            ),
          )
        ],
      );
    } else if (weather.temperature > 20) {
      return TextSpan(
        children: [
          TextSpan(
            text: "The weather is really nice, time for a walk! ",
            style: kTextStyle.copyWith(
              color: Colors.white70,
              fontSize: 20,
            ),
          ),
          const WidgetSpan(
            child: Icon(
              Icons.directions_walk_outlined,
              color: Colors.white,
            ),
          )
        ],
      );
    } else if (weather.temperature < 10) {
      return TextSpan(
        children: [
          TextSpan(
            text: "Freezy 😬. Don't forget gloves ! ",
            style: kTextStyle.copyWith(
              color: Colors.white70,
              fontSize: 20,
            ),
          ),
        ],
      );
    } else {
      return TextSpan(
        children: [
          TextSpan(
            text: 'Bring a jacket just in case! ',
            style: kTextStyle.copyWith(
              color: Colors.white70,
              fontSize: 20,
            ),
          ),
        ],
      );
    }
  }
}
