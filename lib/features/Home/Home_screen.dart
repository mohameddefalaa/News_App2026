import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/features/Home/components/trending_news.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeController()..init();
      },
      child: Consumer<HomeController>(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 350,
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
                              style: TextTheme.of(context).titleMedium!
                                  .copyWith(
                                    color: AppLightColor.primaryColor,
                                    fontSize: 25,
                                  ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Trending News",
                                    style: TextTheme.of(context).titleMedium!
                                        .copyWith(
                                          color: AppLightColor.primarytext,
                                          fontSize: 16,
                                        ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "View all",
                                      style: TextTheme.of(context)
                                          .displayMedium!
                                          .copyWith(
                                            color: AppLightColor.primarytext,
                                            fontSize: 14,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                AppLightColor.primarytext,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TrendingNews(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
