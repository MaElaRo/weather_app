part of 'weather_bloc.dart';

/// WeatherStates
///
/// All the possible states of the App.
abstract class WeatherState extends Equatable {}

class LoadingWeatherState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class LoadedWeatherState extends WeatherState {
  final List<Weather> weather;

  LoadedWeatherState({required this.weather});
  @override
  List<Object?> get props => [weather];
}

class GeneralErrorState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class LocationPermissionErrorState extends WeatherState {
  @override
  List<Object?> get props => [];
}
