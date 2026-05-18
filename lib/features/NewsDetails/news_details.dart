import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/extensions/date_formate_extension.dart';
import 'package:newsapp/core/widgets/custome_cash_networkImage.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        final article = value.topHEadArticleList[index];

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "News Details",
              style: TextTheme.of(context).titleMedium!.copyWith(
                fontSize: 16,
                color: AppLightColor.textPrimary,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomeCashNetwork(
                    imagepath: article.urlToImage,
                    height: 230,
                    width: 345,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.title,
                    style: TextTheme.of(
                      context,
                    ).titleMedium!.copyWith(color: AppLightColor.textPrimary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: Row(
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              article.source!.name.substring(
                                0,
                                min(article.source!.name.length, 15),
                              ),
                              style: TextTheme.of(context).displayMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    color: AppLightColor.textPrimary,
                                  ),
                            ),

                            const SizedBox(width: 10),
                            Text(
                              article.publishedAt.formatTimeAgo(
                                article.publishedAt,
                              ),
                              style: TextTheme.of(context).displayMedium!
                                  .copyWith(
                                    fontSize: 14,
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
                  Text(
                    article.content,
                    style: TextTheme.of(context).displayMedium!
                      ..copyWith(color: AppLightColor.textsecondry),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
