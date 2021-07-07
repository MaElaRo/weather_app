// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherGetResponse _$WeatherGetResponseFromJson(Map<String, dynamic> json) {
  return WeatherGetResponse(
    consolidatedWeather: (json['consolidated_weather'] as List<dynamic>?)
        ?.map((e) => ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
    time: json['time'] as String?,
    sunRise: json['sun_rise'] as String?,
    sunSet: json['sun_set'] as String?,
    timezoneName: json['timezone_name'] as String?,
    parent: json['parent'] == null
        ? null
        : Parent.fromJson(json['parent'] as Map<String, dynamic>),
    sources: (json['sources'] as List<dynamic>?)
        ?.map((e) => Sources.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String?,
    locationType: json['location_type'] as String?,
    woeid: json['woeid'] as int?,
    lattLong: json['latt_long'] as String?,
    timezone: json['timezone'] as String?,
  );
}

Map<String, dynamic> _$WeatherGetResponseToJson(WeatherGetResponse instance) =>
    <String, dynamic>{
      'consolidated_weather': instance.consolidatedWeather,
      'time': instance.time,
      'sun_rise': instance.sunRise,
      'sun_set': instance.sunSet,
      'timezone_name': instance.timezoneName,
      'parent': instance.parent,
      'sources': instance.sources,
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
      'timezone': instance.timezone,
    };

ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) {
  return ConsolidatedWeather(
    id: json['id'] as int?,
    weatherStateName: json['weather_state_name'] as String?,
    weatherStateAbbr: json['weather_state_abbr'] as String?,
    windDirectionCompass: json['wind_direction_compass'] as String?,
    created: json['created'] as String?,
    applicableDate: json['applicable_date'] as String?,
    minTemp: (json['min_temp'] as num?)?.toDouble(),
    maxTemp: (json['max_temp'] as num?)?.toDouble(),
    theTemp: (json['the_temp'] as num?)?.toDouble(),
    windSpeed: (json['wind_speed'] as num?)?.toDouble(),
    windDirection: (json['wind_direction'] as num?)?.toDouble(),
    airPressure: (json['air_pressure'] as num?)?.toDouble(),
    humidity: json['humidity'] as int?,
    visibility: (json['visibility'] as num?)?.toDouble(),
    predictability: json['predictability'] as int?,
  );
}

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'wind_direction_compass': instance.windDirectionCompass,
      'created': instance.created,
      'applicable_date': instance.applicableDate,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    title: json['title'] as String?,
    locationType: json['location_type'] as String?,
    woeid: json['woeid'] as int?,
    lattLong: json['latt_long'] as String?,
  );
}

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
    };

Sources _$SourcesFromJson(Map<String, dynamic> json) {
  return Sources(
    title: json['title'] as String?,
    slug: json['slug'] as String?,
    url: json['url'] as String?,
    crawlRate: json['crawl_rate'] as int?,
  );
}

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'url': instance.url,
      'crawl_rate': instance.crawlRate,
    };
