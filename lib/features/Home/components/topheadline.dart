import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/extensions/date_formate_extension.dart';
import 'package:newsapp/core/widgets/custome_cash_networkImage.dart';
import 'package:newsapp/features/Home/components/news_item.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:newsapp/features/NewsDetails/news_details.dart';
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
                    builder: (_) => ChangeNotifierProvider.value(
                      value: context.watch<HomeController>(),
                      child: NewsDetails(index: index),
                    ),
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
