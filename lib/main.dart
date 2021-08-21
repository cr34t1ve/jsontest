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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<WeatherForecast> futureWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeather = WeatherService().fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<WeatherForecast>(
          //unable to call snapshot data in futurebuilder
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final forecast = snapshot.data;
              final location = forecast!.region;
              final days = forecast.forecastDay;
              return ListView.builder(
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return Text(days[index].date);
                  });
            }
            return Center(
              child: Text(snapshot.error.toString()),
            );
          },
        ));
  }
}
