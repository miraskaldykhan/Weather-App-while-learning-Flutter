import 'dart:convert';
import 'dart:developer';

import 'package:razdel10_practica/models/weather_forecast_daily.dart';
import 'package:razdel10_practica/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:razdel10_practica/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String cityName, bool isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> parameters;

    if (isCity == true) {
      var queryParameters = {
        'APPID': Constants.weather_app_id,
        'units': 'metric',
        'q': cityName
      };
      parameters = queryParameters;
    } else {
      var queryParameters = {
        'APPID': Constants.weather_app_id,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters; 
    }

    var uri = Uri.https(Constants.weather_base_url_domain,
        Constants.weather_forecast_path, parameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print("response: ${response?.body}");

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error("Error response");
    }
  }
}
