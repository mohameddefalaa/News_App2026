import 'package:flutter/material.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/features/Home/components/news_item.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:newsapp/features/NewsDetails/news_details.dart';
import 'package:newsapp/features/NewsDetails/newswebviewdetails.dart';
import 'package:provider/provider.dart';

class TopHeadline extends StatelessWidget {
  const TopHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, value, Widget? child) {
        return SliverList.builder(
          itemCount: value.topHEadArticleList.length,
          itemBuilder: (BuildContext context, int index) {
            var areticle = value.topHEadArticleList[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewsWebViewScreen(url: areticle.url),
                  ),
                );
              },
              child: NewsItem(article: areticle),
            );
          },
        );
      },
    );
  }
}
