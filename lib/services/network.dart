import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  Network(this.url);
  String url;
  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      debugPrint(
        response.statusCode.toString(),
      );
    }
  }
}
