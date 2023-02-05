import 'package:flutter/material.dart';
import 'package:weather_app/assets/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.label, required this.onPress});
  Function() onPress;
  String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: kTextStyle.copyWith(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
