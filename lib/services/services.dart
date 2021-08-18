import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:jsontest/weatherobject.dart';

final String callbackURL =
    'https://api.weatherapi.com/v1/forecast.json?key=83b5ecf2187d4a67807102005210907&q=Accra&days=3&aqi=no&alerts=no';

class WeatherService {
  Future<List<WeatherForecast>> fetchWeather() async {
    http.Response response = await http.get(Uri.parse(callbackURL));
    print(response.body);
    if (response.statusCode == 200) {
      String jsonWeather = response.body;
      final jsonResponse = json.decode(jsonWeather);
      Map weatherMap = jsonDecode(response.body);
      List<dynamic> weatherList = weatherMap['forecast']['forecastday'];
      print(weatherList);
      WeatherForecast weather = new WeatherForecast.fromJson(jsonResponse);
      // print(weather.toString());
      // print(weather.location);
      // print(weather.forecastDay[0].date);
      return weatherList.map((json) => WeatherForecast.fromJson(json)).toList();
    } else {
      throw Exception('something went wrong, ${response.statusCode}');
    }
  }
}
