class WeatherForecast {
  final String location;
  final String region;
  final String currentCondition;
  final List<ForecastDay> forecastDay;

  WeatherForecast({
    required this.location,
    required this.region,
    required this.currentCondition,
    required this.forecastDay,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> parsedJson) {
    return WeatherForecast(
        location: parsedJson['location']['name'],
        region: parsedJson['location']['region'],
        currentCondition: parsedJson['current']['condition']['text'],
        forecastDay: (parsedJson['forecast']['forecastday'] as List)
            .map((i) => ForecastDay.fromJson(i))
            .toList());
  }
}

class ForecastDay {
  final String date;

  ForecastDay({required this.date});

  factory ForecastDay.fromJson(Map<String, dynamic> parsedJson) {
    return ForecastDay(date: parsedJson['date']);
  }
}
