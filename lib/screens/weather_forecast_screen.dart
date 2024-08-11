import 'package:flutter/material.dart';
import 'package:weather_kokorkin/api/weather_api.dart';
import 'package:weather_kokorkin/models/weather_forecast_daily_model.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecastM> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    forecastObject = WeatherApi().fetchWeatherForecast(_cityName);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
