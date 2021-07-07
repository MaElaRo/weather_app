import 'package:intl/intl.dart';

/// Weather Model
///
/// This model is used for the ui and has all the currently used data saved.
/// Furthermore this UI-model has getters to make life easier in the UI.
class Weather {
  final String weatherCondition;
  final int humidity;
  final double airPressure;
  final double currentTemp;
  final double windSpeed;
  final String windDirectionCompass;
  final double minTemp;
  final double maxTemp;
  final String weatherImgAbbr;
  final String dayOfTheWeek;
  DateTime get dateTime => DateTime.parse(dayOfTheWeek);

  String get dayAbbreviation =>
      DateFormat(DateFormat.ABBR_WEEKDAY).format(dateTime);
  String get dayOfWeekName => DateFormat(DateFormat.WEEKDAY).format(dateTime);
  String get imageUrl =>
      'https://www.metaweather.com/static/img/weather/$weatherImgAbbr.svg';
  int get airPressureFormatted => airPressure.round().toInt();
  int get windSpeedFormatted => windSpeed.round().toInt();
  int get minTempFormatted => minTemp.round().toInt();
  int get maxTempFormatted => maxTemp.round().toInt();
  int get currentTempFormatted => currentTemp.round().toInt();
  int get currentTemperatureInFahrenheit =>
      ((currentTempFormatted * 9 / 5) + 32).round().toInt();
  int get maxTemperatureInFahrenheit =>
      ((maxTempFormatted * 9 / 5) + 32).round().toInt();
  int get minTemperatureInFahrenheit =>
      ((minTempFormatted * 9 / 5) + 32).round().toInt();
  Weather(
      {required this.weatherCondition,
      required this.humidity,
      required this.airPressure,
      required this.currentTemp,
      required this.windSpeed,
      required this.windDirectionCompass,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherImgAbbr,
      required this.dayOfTheWeek});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weather &&
          runtimeType == other.runtimeType &&
          weatherCondition == other.weatherCondition &&
          humidity == other.humidity &&
          airPressure == other.airPressure &&
          currentTemp == other.currentTemp &&
          windSpeed == other.windSpeed &&
          windDirectionCompass == other.windDirectionCompass &&
          minTemp == other.minTemp &&
          maxTemp == other.maxTemp &&
          weatherImgAbbr == other.weatherImgAbbr &&
          dayOfTheWeek == other.dayOfTheWeek;

  @override
  int get hashCode =>
      weatherCondition.hashCode ^
      humidity.hashCode ^
      airPressure.hashCode ^
      currentTemp.hashCode ^
      windSpeed.hashCode ^
      windDirectionCompass.hashCode ^
      minTemp.hashCode ^
      maxTemp.hashCode ^
      weatherImgAbbr.hashCode ^
      dayOfTheWeek.hashCode;
}
