import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_location.dart';
import 'package:weather_app/model/server/location_get_response.dart';

var locationDataSourceProvider =
    Provider<LocationDataSource>((ref) => LocationDataSource());

/// Fetches the API weather id.
///
/// In order to get the weather for the current location, the city id is needed from the Api.
class LocationDataSource {
  /// Fetches location id.
  Future<WeatherLocation> getLocationData(
      {required double latitude, required double longitude}) async {
    String url =
        'https://www.metaweather.com/api/location/search/?lattlong=$latitude,$longitude';
    // Using first item since it is the closest city to the location.
    var response = await http.get(Uri.parse(url));
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception('Server returned ${response.statusCode} status code');
    }
    var locationGetResponse =
        LocationGetResponse.fromJson(jsonDecode(response.body).first);
    return WeatherLocation(locationId: locationGetResponse.woeid!);
  }
}
