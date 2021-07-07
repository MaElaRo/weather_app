import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/location_manager.dart';
import 'package:weather_app/data/location_data_source.dart';
import 'package:weather_app/data/location_permission_exception.dart';
import 'package:weather_app/data/weather_data_source.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/weather_location.dart';

part 'weather_state.dart';

var weatherBlocStateProvider = Provider<WeatherBloc>(
  (ref) => WeatherBloc(
    weatherDataSource: ref.read(weatherDataSourceProvider),
    locationDataSource: ref.read(locationDataSourceProvider),
    locationManager: ref.read(getCurrentLocationProvider),
  ),
);

///WeatherBloc contains state logic for the weather app.
///
///This Cubit triggers the loading of the data.
class WeatherBloc extends Cubit<WeatherState> {
  WeatherBloc(
      {required this.weatherDataSource,
      required this.locationDataSource,
      required this.locationManager})
      : super(LoadingWeatherState());
  final WeatherDataSource weatherDataSource;
  final LocationManager locationManager;
  final LocationDataSource locationDataSource;

  void loadWeatherData() async {
    Position location;
    WeatherLocation weatherLocationId;
    List<Weather> weather;

    try {
      emit(LoadingWeatherState());
      location = await locationManager.determinePosition();
      weatherLocationId = await locationDataSource.getLocationData(
          latitude: location.latitude, longitude: location.longitude);
      weather = await weatherDataSource.getWeather(
          locationId: weatherLocationId.locationId);
      emit(LoadedWeatherState(weather: weather));
    } catch (e) {
      if (e is LocationPermissionException) {
        emit(LocationPermissionErrorState());
      } else
        emit(GeneralErrorState());
    }
  }
}
