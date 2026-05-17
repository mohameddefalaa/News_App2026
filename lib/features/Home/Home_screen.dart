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
                      return ListTile(
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
                              errorWidget: (context, url, error) => Image.asset(
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
