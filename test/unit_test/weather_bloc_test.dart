import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/data/location_manager.dart';
import 'package:weather_app/data/location_data_source.dart';
import 'package:weather_app/data/location_permission_exception.dart';
import 'package:weather_app/data/weather_data_source.dart';
import 'package:weather_app/domain/weather/weather_bloc.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/weather_location.dart';

class MockWeatherCubit extends MockCubit<WeatherState> implements WeatherBloc {}

class MockWeatherDataSource extends Mock implements WeatherDataSource {}

class MockLocationDataSource extends Mock implements LocationDataSource {}

class MockCurrentLocation extends Mock implements LocationManager {}

class MockedWeatherState extends Fake implements WeatherState {}

List<Weather> weather = [
  Weather(
      weatherCondition: 'Cloudy',
      humidity: 75,
      airPressure: 123.5,
      currentTemp: 27.9,
      windSpeed: 22.2,
      windDirectionCompass: "NW",
      minTemp: 23.0,
      maxTemp: 30.0,
      weatherImgAbbr: 's',
      dayOfTheWeek: ''),
  Weather(
      weatherCondition: 'Cloudy',
      humidity: 75,
      airPressure: 123.5,
      currentTemp: 27.9,
      windSpeed: 22.2,
      windDirectionCompass: "NW",
      minTemp: 23.0,
      maxTemp: 30.0,
      weatherImgAbbr: 's',
      dayOfTheWeek: '')
];
void main() {
  late WeatherDataSource weatherDataSource;
  late LocationDataSource locationDataSource;
  late LocationManager getLocation;

  setUp(() {
    registerFallbackValue(MockedWeatherState());
    weatherDataSource = MockWeatherDataSource();
    locationDataSource = MockLocationDataSource();
    getLocation = MockCurrentLocation();
  });
  blocTest<WeatherBloc, WeatherState>(
    'WeatherBloc loads data, is in LoadingState and LoadedWeatherState',
    build: () {
      when(() => weatherDataSource.getWeather(
              locationId: any(named: 'locationId')))
          .thenAnswer((_) => Future.value(weather));

      when(() => locationDataSource.getLocationData(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'))).thenAnswer(
        (invocation) => Future.value(
          WeatherLocation(locationId: 123),
        ),
      );

      when(() => getLocation.determinePosition()).thenAnswer((invocation) =>
          Future.value(Position(
              speedAccuracy: 0,
              speed: 0,
              altitude: 0,
              accuracy: 0,
              heading: 0,
              latitude: 0,
              longitude: 0,
              timestamp: DateTime.now())));
      return WeatherBloc(
          weatherDataSource: weatherDataSource,
          locationDataSource: locationDataSource,
          locationManager: getLocation);
    },
    act: (bloc) {
      bloc.loadWeatherData();
    },
    expect: () => [LoadingWeatherState(), LoadedWeatherState(weather: weather)],
  );
  blocTest<WeatherBloc, WeatherState>(
    'WeatherBloc throws Error and is in GeneralErrorState',
    build: () {
      when(() => weatherDataSource.getWeather(
          locationId: any(named: 'locationId'))).thenThrow((_) => Error());

      return WeatherBloc(
          weatherDataSource: weatherDataSource,
          locationDataSource: locationDataSource,
          locationManager: getLocation);
    },
    act: (bloc) {
      bloc.loadWeatherData();
    },
    expect: () => [LoadingWeatherState(), GeneralErrorState()],
  );

  blocTest<WeatherBloc, WeatherState>(
    'WeatherBloc throws LocationPermissionException and is in LocationPermissionErrorState',
    build: () {
      when(() => getLocation.determinePosition())
          .thenThrow(LocationPermissionException());

      return WeatherBloc(
          weatherDataSource: weatherDataSource,
          locationDataSource: locationDataSource,
          locationManager: getLocation);
    },
    act: (bloc) {
      bloc.loadWeatherData();
    },
    expect: () => [LoadingWeatherState(), LocationPermissionErrorState()],
  );
}
