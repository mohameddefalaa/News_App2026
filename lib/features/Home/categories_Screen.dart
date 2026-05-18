import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/extensions/date_formate_extension.dart';
import 'package:newsapp/core/widgets/custome_cash_networkImage.dart';
import 'package:newsapp/features/Home/components/categories_component.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppLightColor.appbarbackground,
            centerTitle: true,
            title: Text(
              "Categories",
              style: TextTheme.of(context).titleMedium!.copyWith(
                fontSize: 16,
                color: AppLightColor.textPrimary,
              ),
            ),
          ),
          body: Column(
            children: [
              CategoriesList(),
              Expanded(
                child: ListView.builder(
                  itemCount: value.topHEadArticleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var areticle = value.topHEadArticleList[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        bottom: 12,
                        right: 12,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomeCashNetwork(imagepath: areticle.urlToImage),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 2,
                                    areticle.title,
                                    style: TextTheme.of(context).displayMedium!
                                        .copyWith(
                                          color: AppLightColor.textPrimary,
                                        ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundImage:
                                            areticle.urlToImage.isEmpty
                                            ? AssetImage(
                                                "assets/images/null.webp",
                                              )
                                            : NetworkImage(areticle.urlToImage),
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              areticle.source!.name.substring(
                                                0,
                                                min(
                                                  areticle.source!.name.length,
                                                  10,
                                                ),
                                              ),
                                              style: TextTheme.of(context)
                                                  .displayMedium!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color: AppLightColor
                                                        .textPrimary,
                                                  ),
                                            ),

                                            const SizedBox(width: 6),
                                            Text(
                                              areticle.publishedAt
                                                  .formatTimeAgo(
                                                    areticle.publishedAt,
                                                  ),
                                              style: TextTheme.of(context)
                                                  .displayMedium!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color: AppLightColor
                                                        .textsecondry,
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
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
