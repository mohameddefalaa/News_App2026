import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bookmark",
          style: TextTheme.of(context).titleMedium!.copyWith(
            fontSize: 16,
            color: AppLightColor.textPrimary,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
