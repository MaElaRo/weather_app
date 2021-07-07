import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide ReadContext;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/domain/weather/weather_bloc.dart';
import 'package:weather_app/ui/components/primary_button.dart';
import 'package:weather_app/ui/ui_config/my_color.dart';
import 'package:weather_app/ui/ui_config/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// LocationPermissionErrorScreen
///
/// Will be displayed when app is in [LocationPermissionErrorState].
class LocationPermissionErrorScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        bloc: useProvider(weatherBlocStateProvider),
        builder: (BuildContext context, WeatherState state) {
          return Scaffold(
            backgroundColor: MyColor.current!.backgroundColor,
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please give us permission to use your location',
                      style: TextStyles.textStyle1(MyColor.current!.textColor),
                    ),
                    SizedBox(height: 20),
                    SvgPicture.asset(
                      'assets/location_error.svg',
                      height: 250,
                    ),
                    SizedBox(height: 20),
                    PrimaryButton(
                        text: 'RETRY',
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyColor.current!.secondaryColor),
                        ),
                        onPressed: () {
                          context
                              .read(weatherBlocStateProvider)
                              .loadWeatherData();
                        },
                        color: MyColor.current!.accentColor),
                    PrimaryButton(
                        text: 'OPEN APP SETTINGS',
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyColor.current!.secondaryColor),
                        ),
                        onPressed: () {
                          AppSettings.openLocationSettings();
                        },
                        color: MyColor.current!.accentColor)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
