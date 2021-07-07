import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/main.dart';

var temperatureConversionBlocProvider = Provider<TemperatureConversionBloc>(
    (ref) => TemperatureConversionBloc(ref.read(sharedPreferencesProvider)));

enum TemperatureUnit { celsius, fahreinheit }

/// This cubit toggles the [TemperatureUnit].
class TemperatureConversionBloc extends Cubit<TemperatureUnit> {
  TemperatureConversionBloc(this.sharedPreferences)
      : super(_preferencesTemperatureUnit(sharedPreferences));

  static String _key = 'temperature_unit';
  final SharedPreferences sharedPreferences;

  /// [returns] the [TemperatureUnit] currently stored in shared preferences
  static TemperatureUnit _preferencesTemperatureUnit(
      SharedPreferences sharedPreferences) {
    var hasKey = sharedPreferences.containsKey(_key);

    if (hasKey) {
      var res = sharedPreferences.getString(_key);
      return res == 'celsius'
          ? TemperatureUnit.celsius
          : TemperatureUnit.fahreinheit;
    } else {
      return TemperatureUnit.celsius;
    }
  }

  /// Toggles Temperatureunit on call.
  void toggleTemperature() {
    if (state == TemperatureUnit.celsius) {
      sharedPreferences.setString(_key, 'celsius');
      emit(TemperatureUnit.fahreinheit);
    } else {
      sharedPreferences.setString(_key, 'fahreinheit');
      emit(TemperatureUnit.celsius);
    }
  }
}
