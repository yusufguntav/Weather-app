// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/customButton.dart';
import 'package:weather_app/widgets/textBox.dart';

TextEditingController cityNameController = TextEditingController();

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextBox(
                    controller: cityNameController,
                    iconWidget: const Icon(
                      Icons.location_city_outlined,
                      color: Colors.white,
                    ),
                    hintText: 'Enter City Name'),
              ),
              CustomButton(
                label: 'Get Weather',
                onPress: (() =>
                    Navigator.pop(context, cityNameController.text)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
