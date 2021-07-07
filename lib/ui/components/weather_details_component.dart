import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide ReadContext;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather_app/domain/temperature_conversion_bloc.dart';
import 'package:weather_app/domain/weather/weather_bloc.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/components/mode_switch.dart';
import 'package:weather_app/ui/ui_config/my_color.dart';
import 'package:weather_app/ui/ui_config/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/ui/weather_home_screen.dart';

///WeatherDetailsComponent
///
///Used in [WeatherHomeScreen] to show Weather details for the currently selected day.
class WeatherDetailsComponent extends HookWidget {
  final Weather weather;

  WeatherDetailsComponent({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      bloc: useProvider(weatherBlocStateProvider),
      listener: (context, state) {
        if (state is LoadedWeatherState) {
          _refreshController.refreshCompleted();
        }
      },
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: () {
          context.read(weatherBlocStateProvider).loadWeatherData();
        },
        header: WaterDropHeader(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '${weather.dayOfWeekName}',
                    style: TextStyles.textStyle4(Colors.grey),
                  ),
                ),
                Spacer(),
                ModeSwitch(),
              ],
            ),
            BlocBuilder<TemperatureConversionBloc, TemperatureUnit>(
                bloc: useProvider(temperatureConversionBlocProvider),
                builder: (BuildContext context, TemperatureUnit unit) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        unit == TemperatureUnit.celsius
                            ? '${weather.currentTempFormatted}°C'
                            : '${weather.currentTemperatureInFahrenheit}°F',
                        style:
                            TextStyles.textStyle5(MyColor.current!.textColor),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read(temperatureConversionBlocProvider)
                              .toggleTemperature();
                        },
                        child: Text(
                          unit == TemperatureUnit.celsius ? '°F' : '°C',
                          style: TextStyles.textStyle1(Colors.grey),
                        ),
                      ),
                    ],
                  );
                }),
            Center(
              child: Column(
                children: [
                  SvgPicture.network(
                    weather.imageUrl,
                    height: 170,
                    width: 170,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    weather.weatherCondition,
                    style: TextStyles.textStyle1(MyColor.current!.textColor),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyles.textStyle2(
                                  MyColor.current!.textColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${weather.humidity}%',
                              style: TextStyles.textStyle1(
                                  MyColor.current!.textColor),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Pressure',
                              style: TextStyles.textStyle2(
                                  MyColor.current!.textColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${weather.airPressureFormatted} mb',
                              style: TextStyles.textStyle1(
                                  MyColor.current!.textColor),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Wind',
                              style: TextStyles.textStyle2(
                                  MyColor.current!.textColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${weather.windSpeedFormatted} mph',
                              style: TextStyles.textStyle1(
                                  MyColor.current!.textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
