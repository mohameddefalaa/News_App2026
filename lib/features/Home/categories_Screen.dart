import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/features/Home/components/categories_component.dart';
import 'package:newsapp/features/Home/components/news_item.dart';
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
            centerTitle: true,
            title: Text(
              "Categories",
              style: TextTheme.of(context).titleMedium!.copyWith(
                fontSize: AppSize.sp16,
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
                    return NewsItem(article: areticle);
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
