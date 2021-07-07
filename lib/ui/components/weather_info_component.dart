import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide ReadContext;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/domain/temperature_conversion_bloc.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/ui/ui_config/my_color.dart';
import 'package:weather_app/ui/ui_config/text_styles.dart';
import 'package:weather_app/ui/weather_home_screen.dart';

///WeatherInfoComponent
///
///
/// Used for [WeatherHomeScreen] to show Forecast and current Weather information briefly.
class WeatherInfoComponent extends HookWidget {
  final VoidCallback onTap;
  final bool selected;
  final Weather weather;

  WeatherInfoComponent({
    Key? key,
    required this.onTap,
    required this.selected,
    required this.weather,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      width: 185,
      child: Card(
        color: selected
            ? MyColor.current?.secondaryColor
            : MyColor.current?.secondaryColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(weather.imageUrl),
              SizedBox(
                height: 5,
              ),
              Text(
                weather.dayAbbreviation,
                style: TextStyles.textStyle2(MyColor.current!.accentColor),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<TemperatureConversionBloc, TemperatureUnit>(
                  bloc: useProvider(temperatureConversionBlocProvider),
                  builder: (BuildContext context, TemperatureUnit unit) {
                    return Text(
                      unit == TemperatureUnit.celsius
                          ? '${weather.minTempFormatted}°C / ${weather.maxTempFormatted}°C'
                          : '${weather.minTemperatureInFahrenheit}°F / ${weather.maxTemperatureInFahrenheit}°F',
                      style:
                          TextStyles.textStyle3(MyColor.current!.accentColor),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
