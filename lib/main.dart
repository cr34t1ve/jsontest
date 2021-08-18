import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:jsontest/addressobject.dart';
import 'package:jsontest/productobject.dart';
import 'package:jsontest/services/services.dart';
import 'package:jsontest/shapeobject.dart';
import 'dart:convert';
import 'package:jsontest/studentobject.dart';
import 'package:jsontest/weatherobject.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

// Future<String> _loadWeatherAsset() async {
//   return await rootBundle.loadString('testjson/weather0.json');
// }

// Future<List<WeatherForecast>> loadWeather() async {
//   String jsonString = await _loadWeatherAsset();
//   final jsonResponse = json.decode(jsonString);
//   WeatherForecast weatherForecast = WeatherForecast.fromJson(jsonResponse);
//   // print(weatherForecast);
//   // print(jsonResponse);
//   // return weatherForecast;
//   // print(weatherForecast.location);
//   // print(weatherForecast.region);
//   // print(weatherForecast.currentCondition);
//   // print(weatherForecast.forecastDay.runtimeType);
//   // print(weatherForecast.forecastDay[0].date);
// }

// ignore: must_be_immutable
class Home extends StatelessWidget {
  WeatherService weatherServiceUnit = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: weatherServiceUnit.fetchWeather(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  // itemCount: snapshot.data,
                  // itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                var weatherData = snapshot.data;
                return Text('dfsf');
              });
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Center(
              child: Text(snapshot.error.toString()),
            );
          },
        ));
  }
}
