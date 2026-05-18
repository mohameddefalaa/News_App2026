import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/features/Home/home_conrtoller.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8, top: 20),
          child: SizedBox(
            height: 40,
            child: ListView.separated(
              padding: EdgeInsets.only(right: 16),
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
                          const SizedBox(height: 3),
                          Container(
                            color: AppLightColor.primaryColor,
                            height: 2,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 12);
              },
              itemCount: value.categories.length,
            ),
          ),
        );
      },
    );
  }
}
