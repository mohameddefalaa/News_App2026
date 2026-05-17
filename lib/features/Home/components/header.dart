import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/features/Home/components/trending_news.dart';
import 'package:newsapp/features/Home/components/view_all_copmponent.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 320,
        child: Stack(
          children: [
            SizedBox(
              height: 245,
              width: double.infinity,
              child: Image.asset(
                "assets/images/imagesback.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              top: 70,
              child: Column(
                children: [
                  Text(
                    "NEWST",
                    style: TextTheme.of(context).titleMedium!.copyWith(
                      color: AppLightColor.primaryColor,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ViewAll(text: "Trending News", onPressed: () {}),
                  TrendingNews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
