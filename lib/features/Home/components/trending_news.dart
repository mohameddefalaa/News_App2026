import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, value, Widget? child) {
        switch (value.everythingstatues) {
          case RequestStatuesEnum.loading:
            return Center(child: CircularProgressIndicator());
          case RequestStatuesEnum.error:
            return Center(child: Text(value.errormessage!));
          case RequestStatuesEnum.loaded:
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
                  var time = formatTimeAgo(article.publishedAt);

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
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: AlignmentGeometry.topCenter,
                              end: AlignmentGeometry.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.5),
                                Colors.black12.withValues(alpha: 0.7),
                              ],
                            ),
                          ),
                        ),

                        Positioned.fill(
                          top: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
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
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 13,
                                          backgroundImage: NetworkImage(
                                            article.urlToImage.toString(),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          article.source!.name,
                                          style: TextTheme.of(context)
                                              .displayMedium!
                                              .copyWith(
                                                fontSize: 14,
                                                color:
                                                    AppLightColor.primarytext,
                                              ),
                                        ),
                                      ],
                                    ),

                                    Text(
                                      time,
                                      style: TextTheme.of(context)
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 14,
                                            color: AppLightColor.primarytext,
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
        }
      },
    );
  }
}

String formatTimeAgo(String publishedAtStr) {
  try {
    DateTime publishedAt = DateTime.parse(
      publishedAtStr,
    ).toLocal(); // .toLocal() عشان يحولها لتوقيت مصر المحلي
    DateTime now = DateTime.now();

    Duration difference = now.difference(publishedAt);

    if (difference.inSeconds < 60) {
      return 'منذ ثوانٍ';
    } else if (difference.inMinutes < 60) {
      return ' ${difference.inMinutes}ago minute';
    } else if (difference.inHours < 24) {
      return ' ${difference.inHours}ago hour';
    } else if (difference.inDays < 30) {
      return ' ${difference.inDays} day ago';
    } else {
      return DateFormat('yyyy-MM-dd').format(publishedAt);
    }
  } catch (e) {
    return 'unknown date';
  }
}
