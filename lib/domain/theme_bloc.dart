import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/ui/ui_config/my_color.dart';

/// ThemeBloc is used to change the color theme of the app.
var themeBlocProvider = Provider<ThemeBloc>(
    (ref) => ThemeBloc(ref.read(sharedPreferencesProvider)));

class ThemeBloc extends Cubit<bool> {
  ThemeBloc(this.sharedPreferences)
      : super(_preferencesLightTheme(sharedPreferences)) {
    if (_preferencesLightTheme(sharedPreferences)) {
      MyColor.current = LightTheme();
    } else {
      MyColor.current = DarkTheme();
    }
  }

  static String _key = 'light_theme';
  final SharedPreferences sharedPreferences;

  /// [returns] whether light theme is stored in the shared preferences
  static bool _preferencesLightTheme(SharedPreferences sharedPreferences) {
    return sharedPreferences.containsKey(_key)
        ? sharedPreferences.getBool(_key)!
        : true;
  }

  /// Toggles Theme on call.
  void toggleTheme() {
    if (state) {
      emit(false);
      sharedPreferences.setBool(_key, false);
      MyColor.current = DarkTheme();
    } else {
      emit(true);
      sharedPreferences.setBool(_key, true);
      MyColor.current = LightTheme();
    }
  }
}
