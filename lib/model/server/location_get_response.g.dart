// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationGetResponse _$LocationGetResponseFromJson(Map<String, dynamic> json) {
  return LocationGetResponse(
    distance: json['distance'] as int?,
    title: json['title'] as String?,
    locationType: json['location_type'] as String?,
    woeid: json['woeid'] as int?,
    lattLong: json['latt_long'] as String?,
  );
}

Map<String, dynamic> _$LocationGetResponseToJson(
        LocationGetResponse instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
    };
