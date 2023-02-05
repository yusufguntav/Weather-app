// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/assets/constants.dart';

class ContentCard extends StatelessWidget {
  ContentCard({super.key, required this.widget});
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: kBackgroundColor,
        child: widget,
      ),
    );
  }
}
