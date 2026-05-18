import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextTheme.of(context).titleMedium!.copyWith(
            fontSize: 16,
            color: AppLightColor.textPrimary,
          ),
        ),
      ),
      body: Container(),
    );
    ;
  }
}
