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
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          //unable to call snapshot data in futurebuilder
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            }
            // if (snapshot.hasError) {
            //   return Center(
            //     child: Text(snapshot.error.toString()),
            //   );
            // }
            return Center(
              child: Text(snapshot.error.toString()),
            );
          },
        ));
  }
}
