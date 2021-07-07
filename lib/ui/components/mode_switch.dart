import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide ReadContext;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app/domain/theme_bloc.dart';
import 'package:weather_app/ui/ui_config/my_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ModeSwitch
///
/// Used to switch from Light mode to Dark mode and back.
class ModeSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
        bloc: useProvider(themeBlocProvider),
        builder: (context, lightTheme) {
          return Container(
            child: Switch(
              value: lightTheme,
              onChanged: (value) {
                context.read(themeBlocProvider).toggleTheme();
              },
              activeColor: MyColor.current!.tertiaryColor,
            ),
          );
        });
  }
}
