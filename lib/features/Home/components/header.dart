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
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 250,
            child: Image.asset(
              "assets/images/imagesback.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 50),
              Text(
                "NEWST",
                style: TextTheme.of(context).titleMedium!.copyWith(
                  color: AppLightColor.primaryColor,
                  fontSize: AppSize.sp24 * 1.04,
                ),
              ),
              SizedBox(height: AppSize.h20 / 2),
              ViewAll(text: "Trending News", onPressed: () {}),
              TrendingNews(),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
