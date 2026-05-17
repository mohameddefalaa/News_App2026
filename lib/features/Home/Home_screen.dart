import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/enumes/request_statues_enum.dart';
import 'package:newsapp/features/Home/components/categories_component.dart';
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
            body: Column(
              children: [
                SizedBox(
                  height: 320,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 245,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/imagesback.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        top: 70,
                        child: Column(
                          children: [
                            Text(
                              "NEWST",
                              style: TextTheme.of(context).titleMedium!
                                  .copyWith(
                                    color: AppLightColor.primaryColor,
                                    fontSize: 25,
                                  ),
                            ),
                            const SizedBox(height: 20),
                            ViewAll(text: 'Trending News', onPressed: () {}),
                            TrendingNews(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ViewAll(
                  text: "Categories",
                  onPressed: () {},
                  color: AppLightColor.textPrimary,
                ),
                Categories(),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
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
                        trailing: Icon(Icons.bookmark),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
