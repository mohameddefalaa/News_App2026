import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });
  final String text;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextTheme.of(context).titleMedium!.copyWith(
              color: color ?? AppLightColor.primarytext,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "View all",
              style: TextTheme.of(context).displayMedium!.copyWith(
                color: color ?? AppLightColor.primarytext,
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: color ?? AppLightColor.primarytext,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
