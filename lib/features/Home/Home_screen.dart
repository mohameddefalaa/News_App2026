import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/features/Home/categories_Screen.dart';
import 'package:newsapp/features/Home/components/categories_component.dart';
import 'package:newsapp/features/Home/components/header.dart';
import 'package:newsapp/features/Home/components/topheadline.dart';
import 'package:newsapp/features/Home/components/toppheadline_shimmer.dart';
import 'package:newsapp/features/Home/components/view_all_copmponent.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:newsapp/features/Home/repos/news_repository.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeController(repository: NewsRepository())..init();
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider.value(
                            value: context.watch<HomeController>(),
                            child: CategoriesScreen(),
                          ),
                        ),
                      );
                    },
                    color: AppLightColor.textPrimary,
                  ),
                ),
                SliverToBoxAdapter(child: CategoriesList()),
                switch (value.topHeadlinestatues) {
                  RequestStatuesEnum.loading => TopHeadLineShimmer(),

                  RequestStatuesEnum.error => SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        value.errormessage.toString(),
                        style: TextTheme.of(context).displayMedium,
                      ),
                    ),
                  ),

                  RequestStatuesEnum.loaded => TopHeadline(),
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