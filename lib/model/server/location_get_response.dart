import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/location_data_source.dart';
import 'package:weather_app/model/weather_location.dart';
part 'location_get_response.g.dart';

/// Class to convert the GET Response data of [LocationDataSource], will be converted to [WeatherLocation].
///
/// This model has all the information the API sends the app. This is just the API model.
@JsonSerializable()
class LocationGetResponse {
  final int? distance;
  final String? title;
  @JsonKey(name: 'location_type')
  final String? locationType;
  final int? woeid;
  @JsonKey(name: 'latt_long')
  final String? lattLong;

  LocationGetResponse(
      {this.distance,
      this.title,
      this.locationType,
      this.woeid,
      this.lattLong});

  factory LocationGetResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LocationGetResponseToJson(this);
}
