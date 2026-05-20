import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/extensions/date_formate_extension.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/core/widgets/custome_cash_networkImage.dart';
import 'package:newsapp/models/news_article_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final NewsArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSize.w16,
        bottom: AppSize.h12,
        right: AppSize.w12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomeCashNetwork(imagepath: article.urlToImage),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: AppSize.w8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    article.title,
                    style: TextTheme.of(
                      context,
                    ).displayMedium!.copyWith(color: AppLightColor.textPrimary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: AppSize.r1 * 10,
                        backgroundImage: article.urlToImage.isEmpty
                            ? AssetImage("assets/images/null.webp")
                            : NetworkImage(article.urlToImage),
                      ),
                      SizedBox(width: AppSize.w4),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              article.source!.name.substring(
                                0,
                                min(article.source!.name.length, 10),
                              ),
                              style: TextTheme.of(context).displayMedium!
                                  .copyWith(
                                    fontSize: AppSize.sp14,
                                    color: AppLightColor.textPrimary,
                                  ),
                            ),

                            const SizedBox(width: 6),
                            Text(
                              article.publishedAt.formatTimeAgo(
                                article.publishedAt,
                              ),
                              style: TextTheme.of(context).displayMedium!
                                  .copyWith(
                                    fontSize: AppSize.sp14,
                                    color: AppLightColor.textsecondry,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark_border),
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
  }
}
