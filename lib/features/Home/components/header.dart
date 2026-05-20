import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/features/Home/components/trending_news.dart';
import 'package:newsapp/features/Home/components/view_all_copmponent.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: AppSize.h32 * 10,
        child: Stack(
          children: [
            SizedBox(
              height: AppSize.h48 * 5.1,
              width: double.infinity,
              child: Image.asset(
                "assets/images/imagesback.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              top: AppSize.h32 * 2.18,
              child: Column(
                children: [
                  Text(
                    "NEWST",
                    style: TextTheme.of(context).titleMedium!.copyWith(
                      color: AppLightColor.primaryColor,
                      fontSize: AppSize.sp24 * 1.04,
                    ),
                  ),
                  SizedBox(height: AppSize.h20),
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
