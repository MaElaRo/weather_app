import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide ReadContext;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/domain/weather/weather_bloc.dart';
import 'package:weather_app/ui/components/general_error_screen.dart';
import 'package:weather_app/ui/components/loading_indicator.dart';
import 'package:weather_app/ui/components/location_permission_error_screen.dart';
import 'package:weather_app/ui/components/weather_details_component.dart';
import 'package:weather_app/ui/components/weather_info_component.dart';
import 'package:weather_app/ui/ui_config/my_color.dart';

///WeatherHomeScreen
///
/// Is the starting screen of the App.
class WeatherHomeScreen extends StatefulHookWidget {
  @override
  _WeatherHomeScreenState createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  /// Index needed for [WeatherDetailsComponent] & [WeatherInfoComponent].
  ///
  /// When the user taps on a [WeatherInfoComponent], the [WeatherDetailsComponent] updates to the tapped index.
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read(weatherBlocStateProvider).loadWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        bloc: useProvider(weatherBlocStateProvider),
        builder: (context, state) {
          if (state is LoadingWeatherState) {
            return LoadingIndicator();
          } else if (state is GeneralErrorState) {
            return GeneralErrorScreen();
          } else if (state is LocationPermissionErrorState) {
            return LocationPermissionErrorScreen();
          } else if (state is LoadedWeatherState) {
            return Scaffold(
              backgroundColor: MyColor.current!.backgroundColor,
              body: SafeArea(
                minimum: EdgeInsets.all(20),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth > 500) {
                      return _buildLandscapeView(state);
                    } else {
                      return Column(
                        children: [
                          Expanded(
                            child: _buildWeatherDetailsView(state),
                          ),
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [..._buildWeatherForecastView(state)],
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            );
          } else {
            return GeneralErrorScreen();
          }
        });
  }

  Widget _buildLandscapeView(LoadedWeatherState state) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: _buildWeatherDetailsView(state),
          ),
          Container(
            height: double.infinity,
            width: 150,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [..._buildWeatherForecastView(state)],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWeatherDetailsView(LoadedWeatherState state) {
    return WeatherDetailsComponent(
      weather: state.weather[currentIndex],
    );
  }

  List<Widget> _buildWeatherForecastView(LoadedWeatherState state) {
    List<Widget> widgetList = [];
    for (int i = 0; i < state.weather.length; i++) {
      widgetList.add(
        WeatherInfoComponent(
          onTap: () {
            setState(() {
              currentIndex = i;
            });
          },
          selected: currentIndex == i,
          weather: state.weather[i],
        ),
      );
    }

    return widgetList;
  }
}
