import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/domain/theme_bloc.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences prefs;

  setUp(() {
    prefs = MockSharedPreferences();
  });

  blocTest<ThemeBloc, bool>(
    'Toggle Theme first time',
    build: () {
      when(() => prefs.getBool(any())).thenReturn(true);
      when(() => prefs.containsKey(any())).thenReturn(true);
      when(() => prefs.setString(any(), any()))
          .thenAnswer((_) => Future.value(true));
      return ThemeBloc(prefs);
    },
    act: (bloc) {
      bloc.toggleTheme();
    },
    expect: () => [false],
  );
}
