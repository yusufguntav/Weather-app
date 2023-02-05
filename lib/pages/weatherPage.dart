// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:weather_app/assets/constants.dart';
import 'package:weather_app/pages/selectLocationPage.dart';
import 'package:weather_app/utils/weatherHelper.dart';
import 'package:weather_app/widgets/contentCard.dart';
import 'package:weather_app/widgets/customButton.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({super.key, required this.weatherHelper});
  WeatherHelper weatherHelper;
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: ContentCard(
                  widget: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: widget.weatherHelper.getWeatherIcon(),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '${widget.weatherHelper.weather.temperature}°',
                              style: kTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ContentCard(
                  widget: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.weatherHelper.weather.cityName.toString(),
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(
                              fontSize: 35, letterSpacing: 2),
                        ),
                        RichText(
                          text: widget.weatherHelper.getMessage(),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Current Location',
                      onPress: () async {
                        await widget.weatherHelper
                            .updateWeatherInformation(true);
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                      label: 'Select Location',
                      onPress: () async {
                        try {
                          String cityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectLocationPage(),
                            ),
                          );
                          int result = await widget.weatherHelper
                              .getWeatherFromCity(cityName);
                          if (result == 404) {
                            Alert(
                              context: context,
                              title: "Wrong City Name",
                              desc: "Please check the city name.",
                              buttons: [
                                DialogButton(
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                  color: kBackgroundColor,
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ).show();
                          }
                          setState(() {});
                        } catch (e) {
                          debugPrint(
                            e.toString(),
                          );
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
