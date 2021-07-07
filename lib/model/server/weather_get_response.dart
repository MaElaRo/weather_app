import 'package:json_annotation/json_annotation.dart';

part 'weather_get_response.g.dart';

/// WeatherGetResponse
///
/// This is the API model with all the information that the app is getting from the API.
@JsonSerializable()
class WeatherGetResponse {
  @JsonKey(name: 'consolidated_weather')
  final List<ConsolidatedWeather>? consolidatedWeather;
  final String? time;
  @JsonKey(name: 'sun_rise')
  final String? sunRise;
  @JsonKey(name: 'sun_set')
  final String? sunSet;
  @JsonKey(name: 'timezone_name')
  final String? timezoneName;
  final Parent? parent;
  final List<Sources>? sources;
  final String? title;
  @JsonKey(name: 'location_type')
  final String? locationType;
  final int? woeid;
  @JsonKey(name: 'latt_long')
  final String? lattLong;
  final String? timezone;

  WeatherGetResponse(
      {this.consolidatedWeather,
      this.time,
      this.sunRise,
      this.sunSet,
      this.timezoneName,
      this.parent,
      this.sources,
      this.title,
      this.locationType,
      this.woeid,
      this.lattLong,
      this.timezone});

  factory WeatherGetResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherGetResponseToJson(this);
}

@JsonSerializable()
class ConsolidatedWeather {
  final int? id;
  @JsonKey(name: 'weather_state_name')
  final String? weatherStateName;
  @JsonKey(name: 'weather_state_abbr')
  final String? weatherStateAbbr;
  @JsonKey(name: 'wind_direction_compass')
  final String? windDirectionCompass;
  final String? created;
  @JsonKey(name: 'applicable_date')
  final String? applicableDate;
  @JsonKey(name: 'min_temp')
  final double? minTemp;
  @JsonKey(name: 'max_temp')
  final double? maxTemp;
  @JsonKey(name: 'the_temp')
  final double? theTemp;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_direction')
  final double? windDirection;
  @JsonKey(name: 'air_pressure')
  final double? airPressure;
  final int? humidity;
  final double? visibility;
  final int? predictability;

  ConsolidatedWeather(
      {this.id,
      this.weatherStateName,
      this.weatherStateAbbr,
      this.windDirectionCompass,
      this.created,
      this.applicableDate,
      this.minTemp,
      this.maxTemp,
      this.theTemp,
      this.windSpeed,
      this.windDirection,
      this.airPressure,
      this.humidity,
      this.visibility,
      this.predictability});

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}

@JsonSerializable()
class Parent {
  final String? title;
  @JsonKey(name: 'location_type')
  final String? locationType;
  final int? woeid;
  @JsonKey(name: 'latt_long')
  final String? lattLong;

  Parent({this.title, this.locationType, this.woeid, this.lattLong});

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
  Map<String, dynamic> toJson() => _$ParentToJson(this);
}

@JsonSerializable()
class Sources {
  final String? title;
  final String? slug;
  final String? url;
  @JsonKey(name: 'crawl_rate')
  final int? crawlRate;

  Sources({this.title, this.slug, this.url, this.crawlRate});

  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);
  Map<String, dynamic> toJson() => _$SourcesToJson(this);
}
