import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  var lon;
  var lat;

  Future<void> getLocation() async {
    await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lon = position.longitude;
      lat = position.latitude;
    } on Exception catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  }
}
