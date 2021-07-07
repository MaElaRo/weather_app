import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide ReadContext;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/domain/theme_bloc.dart';
import 'package:weather_app/ui/weather_home_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

late SharedPreferences _sharedPreferences;

var sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => _sharedPreferences);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Globally make shared preferences available
  // This can be done at app start as it is pretty much instant
  _sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Weather',
        home: HookBuilder(builder: (context) {
          return BlocBuilder<ThemeBloc, bool>(
              bloc: useProvider(themeBlocProvider),
              buildWhen: (a, b) => true,
              builder: (context, state) {
                return WeatherHomeScreen();
              });
        }),
      ),
    );
  }
}
