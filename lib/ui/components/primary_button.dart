import 'package:flutter/material.dart';
import 'package:weather_app/ui/ui_config/text_styles.dart';

/// PrimaryButton
///
/// Button that is used primarily in the App.
class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final ButtonStyle style;
  final String text;

  PrimaryButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.style})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(
        text,
        style: TextStyles.textStyle3(color),
      ),
    );
  }
}
