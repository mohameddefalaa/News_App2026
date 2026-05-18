import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/features/Home/components/categories_component.dart';
import 'package:newsapp/features/Home/components/header.dart';
import 'package:newsapp/features/Home/components/source_data.dart';
import 'package:newsapp/features/Home/components/trending_news.dart';
import 'package:newsapp/features/Home/components/view_all_copmponent.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
            body: CustomScrollView(
              slivers: [
                Header(),
                SliverToBoxAdapter(
                  child: ViewAll(
                    text: "Categories",
                    onPressed: () {},
                    color: AppLightColor.textPrimary,
                  ),
                ),
                SliverToBoxAdapter(child: Categories()),
                switch (value.topHeadlinestatues) {
                  // TODO: Handle this case.
                  RequestStatuesEnum.loading => SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),

                  RequestStatuesEnum.error => SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        value.errormessage.toString(),
                        style: TextTheme.of(context).displayMedium,
                      ),
                    ),
                  ),

                  RequestStatuesEnum.loaded => SliverList.builder(
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
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(8),
                              child: SizedBox(
                                height: 80,
                                width: 140,
                                child: CachedNetworkImage(
                                  imageUrl: areticle.urlToImage,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                        return CircularProgressIndicator();
                                      },
                                  errorWidget: (context, url, error) =>
                                      Image.asset("assets/images/null.webp"),
                                ),
                              ),
                            ),
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
                                      style: TextTheme.of(context)
                                          .displayMedium!
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
                                              : NetworkImage(
                                                  areticle.urlToImage,
                                                ),
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
                                                    areticle
                                                        .source!
                                                        .name
                                                        .length,
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

                                              const SizedBox(width: 8),
                                              Text(
                                                value.formatTimeAgo(
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
                },
              ],
            ),
          );
        },
      ),
    );
  }
}
  

  /*ListTile(
                        title: Text(
                          maxLines: 2,
                          areticle.title,
                          style: TextTheme.of(context).displayMedium,
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(4),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(4),
                            child: CachedNetworkImage(
                              height: 68,
                              width: 122,
                              fit: BoxFit.cover,
                              imageUrl: areticle.urlToImage,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                              errorWidget: (context, url, error) =>
                                  Image.asset(
                                    height: 68,
                                    width: 122,
                                    fit: BoxFit.cover,
                                    "assets/images/null.webp",
                                  ),
                            ),
                          ),
                        ),
                        subtitle: SourceData(
                          article: areticle,
                          color: AppLightColor.textPrimary,
                        ),
                        trailing: Icon(Icons.bookmark_border_outlined),
                      ); */