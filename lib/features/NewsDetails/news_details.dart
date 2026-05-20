import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/extensions/date_formate_extension.dart';
import 'package:newsapp/core/widgets/custome_cash_networkImage.dart';
import 'package:newsapp/core/constant/app_size.dart';
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
                fontSize: AppSize.sp16,
                color: AppLightColor.textPrimary,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSize.dg16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomeCashNetwork(
                    imagepath: article.urlToImage,
                    height: AppSize.h1 * 230,
                    width: AppSize.w1 * 345,
                  ),
                  SizedBox(height: AppSize.h4),
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
                                min(article.source!.name.length, 15),
                              ),
                              style: TextTheme.of(context).displayMedium!
                                  .copyWith(
                                    fontSize: AppSize.sp14,
                                    color: AppLightColor.textPrimary,
                                  ),
                            ),

                            SizedBox(width: AppSize.w1 * 10),
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
