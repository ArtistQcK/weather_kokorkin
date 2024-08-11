import 'dart:convert';
import 'dart:developer';

import 'package:weather_kokorkin/models/weather_forecast_daily_model.dart';
import 'package:weather_kokorkin/utilities/constants.dart';
//http
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecastM> fetchWeatherForecast(String cityName) async {
    var queryParameters = {
      'q': cityName,
      'appid': Constants.weatherAppId,
      'units': 'metric',
      'cnt': '7'
    };

    var uri = Uri.https(Constants.weatherBaseURLDomain,
        Constants.weatherBasePath, queryParameters);

    log('uri: $uri');
    var response = await http.get(uri);
    print('response: ${response.body}');
    if (response.statusCode == 200) {
      return WeatherForecastM.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather forecast');
    }
  }
}
