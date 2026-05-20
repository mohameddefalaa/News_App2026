import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/core/widgets/custome_cash_networkImage.dart';
import 'package:newsapp/features/Home/components/source_data.dart';
import 'package:newsapp/features/Home/components/trending_news_shimmer.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, value, Widget? child) {
        switch (value.everythingstatues) {
          case RequestStatuesEnum.loading:
            return Center(
              child: SizedBox(
                height: AppSize.h40 * 4.5,
                child: TrendingShimmer(),
              ),
            );
          case RequestStatuesEnum.error:
            return Center(child: Text(value.errormessage!));
          case RequestStatuesEnum.loaded:
            return SizedBox(
              height: AppSize.h40 * 4.5,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: AppSize.w8);
                },
                itemCount: value.everyThingArticleList.take(8).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final article = value.everyThingArticleList[index];
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.all(AppSize.dg4),
                    height: AppSize.h40 * 4,
                    width: AppSize.w40 * 5.875,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.r8),
                    ),
                    child: Stack(
                      children: [
                        CustomeCashNetwork(
                          imagepath: article.urlToImage,
                          height: AppSize.h40 * 3.5,
                          width: AppSize.w40 * 5.875,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: AlignmentGeometry.topCenter,
                              end: AlignmentGeometry.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black12.withValues(alpha: 0.8),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.all(AppSize.dg8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  article.title,
                                  style: TextTheme.of(context).titleSmall!
                                      .copyWith(
                                        color: AppLightColor.primarytext,
                                      ),
                                ),
                                SizedBox(height: AppSize.h4),
                                SourceData(article: article),
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
        }
      },
    );
  }
}
