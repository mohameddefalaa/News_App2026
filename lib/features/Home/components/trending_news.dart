import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, value, Widget? child) {
        return SizedBox(
          height: 145,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 8);
            },
            itemCount: value.everyThingArticleList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final article = value.everyThingArticleList[index];

              return Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(4),
                height: 140,
                width: 235,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              article.title,
                              style: TextTheme.of(context).titleSmall!.copyWith(
                                color: AppLightColor.primarytext,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppLightColor.primarytext,
                                  radius: 15,
                                  child: Image.asset(
                                    height: 5.58,
                                    width: 12,
                                    "assets/icons/cnn.png",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
