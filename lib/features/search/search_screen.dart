import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/core/repos/news_repository.dart';
import 'package:newsapp/core/widgets/custome_cash_networkImage.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:newsapp/features/NewsDetails/news_details.dart';
import 'package:newsapp/features/search/searchController.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Searchcontroller(NewsRepository())..init();
      },
      builder: (context, child) {
        final controller = context.watch<Searchcontroller>();
        final model = controller.everyThingArticleList;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Search",
              style: TextTheme.of(context).titleMedium!.copyWith(
                fontSize: AppSize.sp16,
                color: AppLightColor.textPrimary,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppSize.dg16),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      controller.callEveryThing();
                    },
                    controller: controller.serchcontroller,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextTheme.of(context).displayMedium!.copyWith(
                        fontSize: AppSize.sp14,
                        color: AppLightColor.tertiarytext,
                      ),
                      fillColor: AppLightColor.backgroundColor,
                      suffixIcon: Icon(Icons.search, size: AppSize.r24),

                      suffixIconColor: AppLightColor.tertiarytext,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.r4),
                        borderSide: BorderSide(color: AppLightColor.border2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.r4),
                        borderSide: BorderSide(color: AppLightColor.border2),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.h20),
                  controller.everyThingArticleList.isNotEmpty
                      ? Column(
                          children: List.generate(
                            controller.everyThingArticleList.length,
                            (index) {
                              final article =
                                  controller.everyThingArticleList[index];
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) {
                                            return NewsDetails(
                                              article: article,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    contentPadding: EdgeInsetsGeometry.zero,
                                    title: Text(
                                      article.title,
                                      maxLines: 1,
                                      style: TextTheme.of(context)
                                          .displayMedium!
                                          .copyWith(
                                            color:
                                                AppLightColor.placeholdertext,
                                          ),
                                    ),
                                    leading: Icon(Icons.search),
                                    //
                                    // CircleAvatar(
                                    //   backgroundImage: NetworkImage(
                                    //     article.urlToImage,
                                    //   ),
                                    //   radius: AppSize.r12,
                                    // ),
                                  ),

                                  Divider(
                                    color: AppLightColor.border,
                                    thickness: 1,
                                    endIndent: .5,
                                    height: 0,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
