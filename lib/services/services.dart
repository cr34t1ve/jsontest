import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:jsontest/weatherobject.dart';

final String callbackURL =
    'https://api.weatherapi.com/v1/forecast.json?key=83b5ecf2187d4a67807102005210907&q=Accra&days=3&aqi=no&alerts=no';

class WeatherService {
  
}

Future<WeatherForecast> fetchWeather() async {
    http.Response response = await http.get(Uri.parse(callbackURL));
    print(response.body);
    if (response.statusCode == 200) {
      //returning parsed data from json issue
    return WeatherForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('something went wrong, ${response.statusCode}');
    }
  }
