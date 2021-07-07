import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/server/weather_get_response.dart';

var weatherDataSourceProvider =
    Provider<WeatherDataSource>((ref) => WeatherDataSource());

/// API Get Call Weather.
///
/// Fetches the Weather information from the API and converts it to [Weather].
class WeatherDataSource {
  Future<List<Weather>> getWeather({required int locationId}) async {
    String url = 'https://www.metaweather.com/api/location/$locationId/';

    var response = await http.get(Uri.parse(url));

    var weatherGetResponse =
        WeatherGetResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception('Server returned ${response.statusCode} status code');
    }
    List<Weather> weatherData = weatherGetResponse.consolidatedWeather!
        .map((el) => Weather(
            weatherCondition: el.weatherStateName!,
            humidity: el.humidity!,
            airPressure: el.airPressure!,
            currentTemp: el.theTemp!,
            windSpeed: el.windSpeed!,
            windDirectionCompass: el.windDirectionCompass!,
            minTemp: el.minTemp!,
            maxTemp: el.maxTemp!,
            weatherImgAbbr: el.weatherStateAbbr!,
            dayOfTheWeek: el.applicableDate!))
        .toList();

    return weatherData;
  }
}
