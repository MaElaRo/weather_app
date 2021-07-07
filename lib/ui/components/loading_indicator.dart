import 'package:flutter/material.dart';
import 'package:weather_app/ui/ui_config/my_color.dart';

/// LoadingIndicator
///
/// Used whenever Weatherdata is loading.
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.current?.backgroundColor,
      body: Center(
        child: Container(
          child: CircularProgressIndicator(
            color: MyColor.current!.secondaryColor,
            valueColor: AlwaysStoppedAnimation(MyColor.current!.tertiaryColor),
          ),
        ),
      ),
    );
  }
}
