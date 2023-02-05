import 'package:flutter/material.dart';

class CustomWeatherIcon extends StatelessWidget {
  CustomWeatherIcon({super.key, required this.iconData});
  IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 120,
      color: Colors.white,
    );
  }
}
