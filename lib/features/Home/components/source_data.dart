import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:newsapp/models/news_article_model.dart';
import 'package:provider/provider.dart';

class SourceData extends StatelessWidget {
  const SourceData({
    super.key,
    required this.article,
    this.sourcedatacolor,
    this.timrcolor,
  });

  final NewsArticleModel article;
  final Color? sourcedatacolor;
  final Color? timrcolor;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, value, Widget? child) {
        var time = value.formatTimeAgo(article.publishedAt);

        return Row(
          mainAxisSize: MainAxisSize.min,

          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: article.urlToImage.isEmpty
                        ? AssetImage("assets/images/null.webp")
                        : NetworkImage(article.urlToImage),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      article.source!.name,
                      style: TextTheme.of(context).displayMedium!.copyWith(
                        fontSize: 14,
                        color: sourcedatacolor ?? AppLightColor.primarytext,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),
            Text(
              time,
              style: TextTheme.of(context).displayMedium!.copyWith(
                fontSize: 14,
                color: timrcolor ?? AppLightColor.primarytext,
              ),
            ),
          ],
        );
      },
    );
  }
}
