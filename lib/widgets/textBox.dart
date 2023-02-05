import 'package:flutter/material.dart';
import 'package:weather_app/assets/constants.dart';

class TextBox extends StatelessWidget {
  TextBox(
      {super.key,
      required this.controller,
      required this.iconWidget,
      required this.hintText});
  TextEditingController controller;
  Widget iconWidget;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        icon: iconWidget,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none),
        hintText: hintText,
        filled: true,
        fillColor: kBackgroundColor,
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
