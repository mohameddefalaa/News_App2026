import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        return Padding(
          padding: EdgeInsets.only(
            left: AppSize.w8,
            bottom: AppSize.h8,
            top: AppSize.h20 / 2.5,
          ),
          child: SizedBox(
            height: AppSize.h40,
            child: ListView.separated(
              padding: EdgeInsets.only(right: AppSize.w16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final bool isSelected =
                    value.selectedcategory == value.categories[index];
                return InkWell(
                  onTap: () {
                    value.updatedSelectedCategory(index);
                  },
                  child: IntrinsicWidth(
                    child: Column(
                      children: [
                        Text(
                          value.categories[index][0].toUpperCase() +
                              value.categories[index].substring(1),
                          style: TextTheme.of(context).displayMedium!.copyWith(
                            color: AppLightColor.textPrimary,
                          ),
                        ),

                        if (isSelected) ...[
                          SizedBox(height: AppSize.h4 * 0.75),
                          Container(
                            color: AppLightColor.primaryColor,
                            height: AppSize.h1 * 2,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: AppSize.w12);
              },
              itemCount: value.categories.length,
            ),
          ),
        );
      },
    );
  }
}
