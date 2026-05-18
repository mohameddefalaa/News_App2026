import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/features/Home/components/categories_component.dart';
import 'package:newsapp/features/Home/components/topheadline.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeController()..callTopHeadLines(null);
      },
      child: Scaffold(
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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoriesList()),
            TopHeadline(),
          ],
        ),
      ),
    );
  }
}
